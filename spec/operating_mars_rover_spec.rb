require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'
RSpec.describe 'Operating a Mars Rover' do
  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), direction: 'E')

    expect(mars_rover.current_position.x).to eq(0)
    expect(mars_rover.current_position.y).to eq(0)
  end

  it 'has a starting position anywhere away from an origin' do
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 1, y: -1), direction: 'N')

    expect(mars_rover.current_position.x).to eq(1)
    expect(mars_rover.current_position.y).to eq(-1)
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

  it 'cannot be operated when it has a direction that is not north, east, south or west' do
    expect { MarsRover.new(starting_position: Coordinates.new(x: 1, y: -1), direction: 'Unsupported') }
      .to raise_error('Direction must be one of N, E, S or W')
  end

  it 'cannot be operated when it is not given a starting position' do
    expect { MarsRover.new(starting_position: nil, direction: 'W') }
      .to raise_error('A starting position in the form of coordinates must be provided')
  end

  it 'receives an list of commands'
end