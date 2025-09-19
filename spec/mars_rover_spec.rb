RSpec.describe 'Mars Rover' do
  class MarsRover
    attr_reader :current_position

    def initialize(starting_position:)
      @current_position = starting_position
    end
  end

  it 'knows its current position' do
    mars_rover = MarsRover.new(starting_position: [1, 1])

    expect(mars_rover.current_position).to eq([1, 1])
  end

  it 'knows its position when it is located anywhere' do
    mars_rover = MarsRover.new(starting_position: [0, 5])

    expect(mars_rover.current_position).to eq([0, 5])
  end

  it 'knows the direction it is facing'

  it 'complains that it does not have a starting point'

  it 'complains that it does not have a direction'

  it 'complains when it has a direction that is not N, E, S, W'
end