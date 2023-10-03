require 'ostruct'
require_relative '../lib/mars_rover'
RSpec.describe 'Operating a Mars Rover' do
  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(starting_position: OpenStruct.new(x: 0, y: 0), direction: 'E')

    expect(mars_rover.current_position).to eq(OpenStruct.new(x: 0, y: 0))
  end

  it 'has a starting position anywhere away from an origin' do
    mars_rover = MarsRover.new(starting_position: OpenStruct.new(x: 1, y: -1), direction: 'N')

    expect(mars_rover.current_position).to eq(OpenStruct.new(x: 1, y: -1))
  end

  it 'has a direction' do
    mars_rover = MarsRover.new(starting_position: OpenStruct.new(x: 1, y: -1), direction: 'S')

    expect(mars_rover.direction).to eq('S')
  end

  it 'can face any direction, north, east, south or west' do
    mars_rover = MarsRover.new(starting_position: OpenStruct.new(x: 1, y: -1), direction: 'E')

    expect(mars_rover.direction).to eq('E')
  end

  it 'cannot be operated when it has a direction that is not north, east, south or west'

  it 'cannot be operated when it is not given a starting position'
end