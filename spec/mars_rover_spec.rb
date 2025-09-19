RSpec.describe 'Mars Rover' do
  class MarsRover
    attr_reader :current_position
    attr_reader :current_direction

    def initialize(starting_position: [0,0], starting_direction: 0)
      @current_position = starting_position
      @current_direction = starting_direction
    end
  end

  positions = [
    [1, 1],
    [0, 5],
    [0, 0],
    [-1, 4]
  ]

  positions.each do |position|
    it "knows its current position (#{position})" do
      mars_rover = MarsRover.new(starting_position: position)

      expect(mars_rover.current_position).to eq(position)
    end
  end

  it 'knows the direction it is facing' do
    # direction is in bearing
    # direction is from 0 to 360 (not inclusive)
    # assume north is 0
    direction = 0
    mars_rover = MarsRover.new(starting_position: [1,1], starting_direction: direction)
    expect(mars_rover.current_direction).to eq(direction)
  end

  it 'complains that it does not have a starting point'

  it 'complains that it does not have a direction'

  it 'complains when it has a direction that is not N, E, S, W'
end