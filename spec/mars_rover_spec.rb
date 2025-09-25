RSpec.describe 'Mars Rover' do
  class MarsRover
    attr_reader :current_position
    attr_reader :current_direction

    def initialize(starting_position: [0,0], starting_direction:)
      if !['N', 'E', 'W', 'S'].include? starting_direction
        raise "Invalid direction"
      end
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
      mars_rover = MarsRover.new(starting_position: position, starting_direction: 'N')

      expect(mars_rover.current_position).to eq(position)
    end
  end

  it 'knows the direction it is facing' do
    direction = 'N'
    mars_rover = MarsRover.new(starting_position: [1,1], starting_direction: direction)
    expect(mars_rover.current_direction).to eq(direction)
  end

  it 'complains that it does not have a starting position' do
    expect{ MarsRover.new(starting_direction: 'N') }.to raise_error(StandardError)
  end
  it 'complains that it does not have a direction' do
    expect{ MarsRover.new(starting_position: [1,1]) }.to raise_error(StandardError)
  end

  it 'complains when it has a direction that is not N, E, S, W' do
    expect{ MarsRover.new(starting_position: [1,1], starting_direction: 'X') }.to raise_error(StandardError)
  end
end