RSpec.describe 'Mars Rover' do
  class MarsRover
    def initialize(starting_position:)
      @current_position = [1, 1]
    end

    def current_position
      [1,1]
    end
  end

  it 'knows its current position' do
    mars_rover = MarsRover.new(starting_position: [1, 1])

    expect(mars_rover.current_position).to eq([1, 1])
  end

  it 'knows the direction it is facing'

  it 'complains that it does not have a starting point'

  it 'complains that it does not have a direction'

  it 'complains when it has a direction that is not N, E, S, W'
end