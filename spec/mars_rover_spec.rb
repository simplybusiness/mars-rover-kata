require 'ostruct'
require './mars_rover/mars_rover.rb'

describe 'Mars Rover' do
  it 'knows its starting point' do
    mars_rover = MarsRover.new

    expect(mars_rover.current_position).to eq(OpenStruct.new(x: 0, y: 0))
  end

  it 'has a starting point anywhere on the planet' do
    mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 3))

    expect(mars_rover.current_position).to eq(OpenStruct.new(x: 2, y: 3))
  end

  it 'knows the direction is facing (N, S, E, W)' do
    mars_rover = MarsRover.new

    expect(mars_rover.direction).to eq('N')
  end

  directions = %w[N E S W]

  directions.each do |direction|
    it "can have a starting direction of #{direction}" do
      mars_rover = MarsRover.new(direction: direction)
      expect(mars_rover.direction).to eq(direction)
    end
  end

  it 'cannot be initialized with a direction outside of (N, S, E, W)' do
    expect { MarsRover.new(direction: 'Z') }.to raise_error(ArgumentError, "Direction must be one of 'N', 'E', 'S', 'W'")
  end

  it 'cannot be initialized w/o a starting point'
end
