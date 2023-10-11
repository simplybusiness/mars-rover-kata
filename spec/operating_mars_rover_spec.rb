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

  ['Unsupported', 'A', 1, {direction: 'north'}].each do |direction|
    it "cannot be operated when it has a direction that is not north, east, south or west e.g. '#{direction}'" do
      expect { MarsRover.new(starting_position: Coordinates.new(x: 1, y: -1), direction: direction) }
        .to raise_error('Direction must be one of N, E, S or W')
    end

  end

  [nil, '(1, 1)', 1, 2.4].each do |starting_point|
    it "cannot be operated when it is not given a starting position e.g. #{starting_point.inspect}" do
      expect { MarsRover.new(starting_position: starting_point, direction: 'W') }
        .to raise_error('A starting position in the form of coordinates must be provided')
    end
  end

  it 'receives a list of commands' do
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: -1, y: -1), direction: 'S')

    expect(mars_rover).to respond_to(:execute).with(1)
  end

  it 'cannot interpret commands when they are a string'

  describe 'moving forwards' do
    it 'moves forwards when facing north'
    it 'moves forwards when facing east'
    it 'moves forwards when facing south'
    it 'moves forwards when facing west'
  end

  describe 'moving backwards' do
    it 'moves backwards when facing north'
    it 'moves backwards when facing east'
    it 'moves backwards when facing south'
    it 'moves backwards when facing west'
  end

  it 'does not execute any commands it does not recognise'
  it 'fails to execute any commands it does not recognise by raising an exception'
end