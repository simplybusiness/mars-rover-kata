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

    expect(mars_rover.direction).to eq('S')
  end

  %w{N E S W}.each do |direction|
    it "can face any direction, e.g. #{direction}" do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 1, y: -1), direction: direction)

      expect(mars_rover.direction).to eq(direction)
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
    it 'moves forwards when facing north from the origin' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'N')

      mars_rover.execute(['f'])

      expected_position = Coordinates.new(x: 0, y: 1)
      expect(mars_rover).to be_located_at(expected_position)
    end

    it 'moves forwards when facing north at any starting point on the positive y-axis' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 2), direction: 'N')

      mars_rover.execute(['f'])

      expected_position = Coordinates.new(x: 0, y: 3)
      expect(mars_rover).to be_located_at(expected_position)
    end

    it 'moves forwards when facing east' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'E')

      mars_rover.execute(['f'])

      expected_position = Coordinates.new(x: 1, y: 0)
      expect(mars_rover).to be_located_at(expected_position)
    end

    it 'moves forwards when facing south' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'S')

      mars_rover.execute(['f'])

      expected_position = Coordinates.new(x: 0, y: -1)
      expect(mars_rover).to be_located_at(expected_position)
    end

    it 'moves forwards when facing west' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'W')

      mars_rover.execute(['f'])

      expected_position = Coordinates.new(x: -1, y: 0)
      expect(mars_rover).to be_located_at(expected_position)
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
    # Obsolete test?
    it 'moves backwards when facing north from the origin' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'N')

      mars_rover.execute(['b'])

      expected_coordinates = Coordinates.new(x: 0, y: -1)
      expect(mars_rover).to be_located_at(expected_coordinates)
    end

    # Obsolete test?
    it 'moves backwards when facing north at any starting point on the y-axis' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 2), direction: 'N')

      mars_rover.execute(['b'])

      expected_coordinates = Coordinates.new(x: 0, y: 1)
      expect(mars_rover).to be_located_at(expected_coordinates)
    end

    it 'moves backwards when facing north from any starting point in the coordinates system' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 2, y: 3), direction: 'N')

      mars_rover.execute(['b'])

      expected_coordinates = Coordinates.new(x: 2, y: 2)
      expect(mars_rover).to be_located_at(expected_coordinates)
    end

    it 'moves backwards when facing east'
    it 'moves backwards when facing south'
    it 'moves backwards when facing west'
    it 'never changes direction'
  end

  it 'does not execute any commands it does not recognise'
  it 'fails to execute any commands it does not recognise by raising an exception'

  RSpec::Matchers.define(:be_located_at) do |expected_position|
    match { |mars_rover| mars_rover.current_position == expected_position }
  end
end