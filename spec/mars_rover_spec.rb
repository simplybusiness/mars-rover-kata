describe 'Mars Rover' do
  class MarsRover
    def current_position(coordinates)
      coordinates
    end
  end

  it 'has an initial position' do
    mars_rover = MarsRover.new
    expect(mars_rover.current_position([1, 2])).to eq([1, 2])
  end

  it 'has an initial position at any point on the planet' do
    mars_rover = MarsRover.new
    expect(mars_rover.current_position([0, 0])).to eq([0, 0])
  end

  it 'has a direction that it is facing'
  it 'cannot have a direction outside of N, E, S or W'
  it 'cannot have a null position'
end
