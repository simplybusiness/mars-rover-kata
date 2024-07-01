require 'ostruct'
describe 'Mars Rover' do
  class MarsRover
    def initialize(starting_point:)

    end

    def current_position
      OpenStruct.new(x: 0, y: 0)
    end

    def inspect
      'a Mars Rover'
    end
  end

  it 'knows its starting point' do
    mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 0, y: 0))

    expect(mars_rover.current_position).to eq(OpenStruct.new(x: 0, y: 0))
  end
  it 'knows the direction is facing (N, S, E, W)'
  it 'cannot be initialized with a direction outside of (N, S, E, W)'
  it 'cannot be initialized w/o a starting point'
end