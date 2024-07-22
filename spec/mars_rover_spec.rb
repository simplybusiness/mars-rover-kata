describe 'Mars Rover' do
  class MarsRover
    attr_reader :current_position, :current_direction

    def initialize(current_position, current_direction)
      @current_position = current_position
      @current_direction = current_direction
      raise 'Invalid direction' unless ['N', 'E', 'S', 'W'].include?(@current_direction)
    end
  end

  it 'has an initial position' do
    mars_rover = MarsRover.new([1, 2],  'N')
    expect(mars_rover.current_position).to eq([1, 2])
  end

  it 'set the current direction as south' do
    mars_rover = MarsRover.new([5, 0], 'S')
    expect(mars_rover.current_direction).to eq('S')
  end
  it 'cannot have a direction outside of N, E, S or W' do
    expect { MarsRover.new([0, 0], 'Z') }.to raise_error('Invalid direction')
  end
  it 'cannot have a null position'

end
