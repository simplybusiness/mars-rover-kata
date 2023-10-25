require 'mars_rover_helper'
RSpec.describe 'Operating a Mars Rover' do
  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'E')

    expected_position = Coordinates.new(x: 0, y: 0)
    expect(mars_rover).to be_located_at(expected_position)
  end

  it 'has a starting position anywhere away from an origin' do
    mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 1), direction: 'N')

    expected_position = Coordinates.new(x: 1, y: 1)
    expect(mars_rover).to be_located_at(expected_position)
  end

  it 'has a direction' do
    mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 2), direction: 'S')

    expect(mars_rover).to be_facing('S')
  end

  %w{N E S W}.each do |direction|
    it "can face any direction, e.g. #{direction}" do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 2, y: 0), direction: direction)

      expect(mars_rover).to be_facing(direction)
    end
  end

  ['Unsupported', 'A', 1, {direction: 'north'}].each do |direction|
    it "cannot be operated when it has a direction that is not north, east, south or west e.g. '#{direction}'" do
      pending 'Discussion with the customer'
      expect { MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 0), direction: direction) }
        .to raise_error('Direction must be one of N, E, S or W')
    end

  end

  [nil, '(1, 1)', 1, 2.4].each do |starting_point|
    it "cannot be operated when it is not given a starting position e.g. #{starting_point.inspect}" do
      pending 'Discussion with the customer'
      expect { MarsRover.new(map: Map.new, starting_position: starting_point, direction: 'W') }
        .to raise_error('A starting position in the form of coordinates must be provided')
    end
  end

  it 'receives a list of commands' do
    mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'S')

    expect(mars_rover).to respond_to(:execute).with(1)
  end

  it 'cannot interpret commands when they are a string' do
    pending 'Discussion with the customer'
    expect { MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'W').execute('f') }
      .to raise_error('A command must consist of a list of individual commands e.g. %w{f b l r}')
  end

  describe 'Turning left' do
    def self.mars_rover_facing(direction:)
      MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 2), direction: direction)
    end

    [
      {
        mars_rover: mars_rover_facing(direction: 'N'),
        expected_direction: 'W'
      },
      {
        mars_rover: mars_rover_facing(direction: 'E'),
        expected_direction: 'N'
      },
      {
        mars_rover: mars_rover_facing(direction: 'S'),
        expected_direction: 'E'
      },
      {
        mars_rover: mars_rover_facing(direction: 'W'),
        expected_direction: 'S'
      }
    ].each do |row|
      example "a Mars rover facing #{row[:mars_rover].direction} turns left to face #{row[:expected_direction]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['l'])

        expect(mars_rover).to be_facing(row[:expected_direction])
      end
    end

    it 'can turn left multiple times' do
      anywhere = Coordinates.new(x: 0, y: 0)
      mars_rover = MarsRover.new(map: Map.new, starting_position: anywhere, direction: 'N')

      expect { mars_rover.execute(%w{l l}) }.to change(mars_rover, :direction).to 'S'
    end

    it 'remains at its current position' do
      anywhere = Coordinates.new(x: 4, y: 6)
      mars_rover = MarsRover.new(map: Map.new, starting_position: anywhere, direction: 'N')

      expect { mars_rover.execute(['l']) }.not_to change(mars_rover, :current_position)
    end
  end

  describe 'Turning right' do
    def self.mars_rover_facing(direction:)
      MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 2), direction: direction)
    end

    [
      {
        mars_rover: mars_rover_facing(direction: 'N'),
        expected_direction: 'E'
      },
      {
        mars_rover: mars_rover_facing(direction: 'E'),
        expected_direction: 'S'
      },
      {
        mars_rover: mars_rover_facing(direction: 'S'),
        expected_direction: 'W'
      },
      {
        mars_rover: mars_rover_facing(direction: 'W'),
        expected_direction: 'N'
      }
    ].each do |row|
      example "a Mars rover facing #{row[:mars_rover].direction} turns right to face #{row[:expected_direction]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['r'])

        expect(mars_rover).to be_facing(row[:expected_direction])
      end
    end

    it 'can turn right multiple times' do
      anywhere = Coordinates.new(x: 3, y: 5)
      mars_rover = MarsRover.new(map: Map.new, starting_position: anywhere, direction: 'S')

      expect { mars_rover.execute(%w{r r r}) }.to change(mars_rover, :direction).to 'E'
    end

    it 'remains at its current position' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 4), direction: 'E')

      expect { mars_rover.execute(['r']) }.not_to change(mars_rover, :current_position)
    end
  end

  it 'does not execute any commands it does not recognise' do
    mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 5), direction: 'W')

    expect { mars_rover.execute(['x']) }.not_to change(mars_rover, :direction)
    expect { mars_rover.execute(['z']) }.not_to change(mars_rover, :current_position)
  end
  it 'fails to execute any commands it does not recognise by raising an exception'

  it 'can traverse a complicated path consisting of all supported commands f, b, l and r' do
    mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'N')

    mars_rover.execute(%w{f r f f r f l b})
    expect(mars_rover).to be_located_at(Coordinates.new(x: 1, y: 0)).and be_facing('E')
  end
end