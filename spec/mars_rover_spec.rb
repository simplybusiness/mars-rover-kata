require 'ostruct'
describe 'Mars Rover' do
  class MarsRover
    attr_reader :current_position

    def initialize(starting_point: OpenStruct.new(x: 0, y: 0))
      @current_position = starting_point
    end

    def inspect
      'a Mars Rover'
    end

    def direction
      'N'
    end
  end

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
  it 'cannot be initialized with a direction outside of (N, S, E, W)'
  it 'cannot be initialized w/o a starting point'
end
