describe 'Mars Rover' do
  class MarsRover
    def initialize(current_position)
      @current_position = current_position
    end
    def current_position
      @current_position
    end
    def current_direction
      'N'
    end
  end

  it 'has an initial position' do
    mars_rover = MarsRover.new([1, 2])
    expect(mars_rover.current_position).to eq([1, 2])
  end

  it 'has a direction that it is facing' do
    mars_rover = MarsRover.new([1, 2])
    expect(mars_rover.current_direction).to eq('N')
  end
  it 'cannot have a direction outside of N, E, S or W'
  it 'cannot have a null position'
end
