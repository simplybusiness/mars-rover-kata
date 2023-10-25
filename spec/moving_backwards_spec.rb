require_relative '../lib/coordinates'
require_relative '../lib/map'
require_relative '../lib/mars_rover'
require 'mars_rover_matchers'
describe 'Moving backwards' do
  [
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 1), direction: 'N'),
      expected_position: Coordinates.new(x: 0, y: 0)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 2), direction: 'N'),
      expected_position: Coordinates.new(x: 0, y: 1)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 2, y: 3), direction: 'N'),
      expected_position: Coordinates.new(x: 2, y: 2)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 2, y: 0), direction: 'E'),
      expected_position: Coordinates.new(x: 1, y: 0)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'S'),
      expected_position: Coordinates.new(x: 0, y: 1)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'W'),
      expected_position: Coordinates.new(x: 1, y: 0)
    }
  ].each do |row|
    example "#{row[:mars_rover].inspect} moves backwards to #{row[:expected_position]}" do
      mars_rover = row[:mars_rover]

      mars_rover.execute(['b'])

      expect(mars_rover).to be_located_at(row[:expected_position])
    end
  end

  it 'can move backwards multiple times' do
    mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 3, y: 1), direction: 'E')

    expected_location = Coordinates.new(x: 0, y: 1)
    expect { mars_rover.execute(%w{b b b}) }.to change(mars_rover, :current_position).to expected_location
  end

  %w{N E S W}.each do |direction|
    it "never changes direction e.g. it remains facing #{direction}" do
      anywhere = Coordinates.new(x: 0, y: 2)
      mars_rover = MarsRover.new(map: Map.new, starting_position: anywhere, direction: direction)

      expect { mars_rover.execute(['b']) }.not_to change(mars_rover, :direction)
    end
  end
end
