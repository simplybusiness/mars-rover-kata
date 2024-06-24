describe 'Mars Rover' do
  class MarsRover
    def initialize(current_position, current_direction)
      @current_position = current_position
      @current_direction = current_direction
    end
    def current_position
      @current_position
    end
    def current_direction
      @current_direction
    end
  end

  it 'has an initial position' do
    mars_rover = MarsRover.new([1, 2],  'N')
    expect(mars_rover.current_position).to eq([1, 2])
  end

  it 'set the current direction as south' do
    mars_rover = MarsRover.new([1, 2], 'S')
    expect(mars_rover.current_direction).to eq('S')
  end
  it 'cannot have a direction outside of N, E, S or W'
  it 'cannot have a null position'
end
