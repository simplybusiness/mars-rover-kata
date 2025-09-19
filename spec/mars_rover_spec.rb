RSpec.describe 'Mars Rover' do
  class MarsRover
    attr_reader :current_position

    def initialize(starting_position:)
      @current_position = starting_position
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

  it 'knows the direction it is facing'

  it 'complains that it does not have a starting point'

  it 'complains that it does not have a direction'

  it 'complains when it has a direction that is not N, E, S, W'
end