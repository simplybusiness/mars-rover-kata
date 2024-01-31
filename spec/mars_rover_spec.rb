require_relative '../lib/mars_rover'

describe 'Exploration with Mars Rover' do
  it 'has a current position on the planet' do
    mars_rover = MarsRover.new(x: 0, y: 0)
    expect(mars_rover.x).to eq(0)
    expect(mars_rover.y).to eq(0)
  end
end