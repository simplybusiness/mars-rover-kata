require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'
RSpec.describe 'Operating a Mars Rover' do
  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'E')

    expected_position = Coordinates.new(x: 0, y: 0)
    expect(mars_rover).to be_located_at(expected_position)
  end

  it 'has a starting position anywhere away from an origin' do
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 1, y: -1), direction: 'N')

    expected_position = Coordinates.new(x: 1, y: -1)
    expect(mars_rover).to be_located_at(expected_position)
  end

  it 'has a direction' do
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 1, y: -1), direction: 'S')

    expect(mars_rover).to be_facing('S')
  end

  %w{N E S W}.each do |direction|
    it "can face any direction, e.g. #{direction}" do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 1, y: -1), direction: direction)

      expect(mars_rover).to be_facing(direction)
    end
  end

  ['Unsupported', 'A', 1, {direction: 'north'}].each do |direction|
    it "cannot be operated when it has a direction that is not north, east, south or west e.g. '#{direction}'" do
      pending 'Discussion with the customer'
      expect { MarsRover.new(starting_position: Coordinates.new(x: 1, y: -1), direction: direction) }
        .to raise_error('Direction must be one of N, E, S or W')
    end

  end

  [nil, '(1, 1)', 1, 2.4].each do |starting_point|
    it "cannot be operated when it is not given a starting position e.g. #{starting_point.inspect}" do
      pending 'Discussion with the customer'
      expect { MarsRover.new(starting_position: starting_point, direction: 'W') }
        .to raise_error('A starting position in the form of coordinates must be provided')
    end
  end

  it 'receives a list of commands' do
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: -1, y: -1), direction: 'S')

    expect(mars_rover).to respond_to(:execute).with(1)
  end

  it 'cannot interpret commands when they are a string' do
    pending 'Discussion with the customer'
    expect { MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'W').execute('f') }
      .to raise_error('A command must consist of a list of individual commands e.g. %w{f b l r}')
  end

  describe 'moving forwards' do
    [
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'N'),
        expected_position: Coordinates.new(x: 0, y: 1)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 0, y: 2), direction: 'N'),
        expected_position: Coordinates.new(x: 0, y: 3)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 1, y: 2), direction: 'N'),
        expected_position: Coordinates.new(x: 1, y: 3)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'E'),
        expected_position: Coordinates.new(x: 1, y: 0)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'S'),
        expected_position: Coordinates.new(x: 0, y: -1)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'W'),
        expected_position: Coordinates.new(x: -1, y: 0)
      }
    ].each do |row|
      example "#{row[:mars_rover].inspect} moves forwards to #{row[:expected_position]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(row[:expected_position])
      end
    end

    %w{N E S W}.each do | direction |
      it "never changes direction from #{direction}" do
        mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: direction)

        expect { mars_rover.execute(['f']) }.not_to change(mars_rover, :direction)
      end
    end

    it 'can move forwards multiple times' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'N')

      mars_rover.execute(%w{f f f f})

      expect(mars_rover).to be_located_at(Coordinates.new(x: 0, y: 4))
    end
  end

  describe 'moving backwards' do
    [
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'N'),
        expected_position: Coordinates.new(x: 0, y: -1)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 0, y: 2), direction: 'N'),
        expected_position: Coordinates.new(x: 0, y: 1)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 2, y: 3), direction: 'N'),
        expected_position: Coordinates.new(x: 2, y: 2)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 2, y: 0), direction: 'E'),
        expected_position: Coordinates.new(x: 1, y: 0)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'S'),
        expected_position: Coordinates.new(x: 0, y: 1)
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'W'),
        expected_position: Coordinates.new(x: 1, y: 0)
      }
    ].each do |row|
      example "#{row[:mars_rover].inspect} moves backwards to #{row[:expected_position]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['b'])

        expect(mars_rover).to be_located_at(row[:expected_position])
      end
    end
    %w{N E S W}.each do |direction|
      it "never changes direction e.g. it remains facing #{direction}" do
        anywhere = Coordinates.new(x: -1, y: 2)
        mars_rover = MarsRover.new(starting_position: anywhere, direction: direction)

        expect { mars_rover.execute(['b']) }.not_to change(mars_rover, :direction)
      end
    end
  end

  describe 'Turning left' do
    [
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 1, y: 2), direction: 'N'),
        expected_direction: 'W'
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: -1, y: 2), direction: 'E'),
        expected_direction: 'N'
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: 1, y: -2), direction: 'S'),
        expected_direction: 'E'
      },
      {
        mars_rover: MarsRover.new(starting_position: Coordinates.new(x: -1, y: -2), direction: 'W'),
        expected_direction: 'S'
      }
    ].each do |row|
      example "a Mars rover facing #{row[:mars_rover].direction} turns left to face #{row[:expected_direction]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['l'])

        expect(mars_rover).to be_facing(row[:expected_direction])
      end
    end

    it 'remains at its current position' do
      anywhere = Coordinates.new(x: 4, y: 6)
      mars_rover = MarsRover.new(starting_position: anywhere, direction: 'N')

      expect { mars_rover.execute(['l']) }.not_to change(mars_rover, :current_position)
    end
  end

  describe 'Turning right' do
    example 'a Mars rover facing N turns right to face E'
    example 'a Mars rover facing E turns right to face S'
    example 'a Mars rover facing S turns right to face W'
    example 'a Mars rover facing W turns right to face N'
    it 'remains at its current position'
  end

  it 'does not execute any commands it does not recognise'
  it 'fails to execute any commands it does not recognise by raising an exception'

  RSpec::Matchers.define(:be_located_at) do |expected_position|
    match { |mars_rover| mars_rover.current_position == expected_position }
  end

  RSpec::Matchers.define(:be_facing) do |expected_direction|
    match { |mars_rover| mars_rover.direction == expected_direction }
  end
end