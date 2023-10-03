require 'ostruct'
RSpec.describe 'Operating a Mars Rover' do
  class MarsRover
    attr_reader :current_position

    def initialize(starting_position: nil)
      @current_position = starting_position
    end
  end

  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(starting_position: OpenStruct.new(x: 0, y: 0))

    expect(mars_rover.current_position).to eq(OpenStruct.new(x: 0, y: 0))
  end

  it 'has a starting position anywhere away from an origin' do
    mars_rover = MarsRover.new(starting_position: OpenStruct.new(x: 1, y: -1))

    expect(mars_rover.current_position).to eq(OpenStruct.new(x: 1, y: -1))
  end

  it 'has a direction'

  it 'cannot be operated when it has a direction that is not north, east, south or west'

  it 'cannot be operated when it is not given a starting position'
end