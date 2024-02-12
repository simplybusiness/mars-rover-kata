$LOAD_PATH << '../lib'
require 'mars_rover'

describe 'Exploration with Mars Rover' do
  it 'has a current position on the planet' do
    mars_rover = MarsRover.new(x: 0, y: 0)
    expect(mars_rover.x).to eq(0)
    expect(mars_rover.y).to eq(0)
  end

  it 'has a position and a direcion' do
    mars_rover = MarsRover.new(direction: 'N')
    expect(mars_rover.direction).not_to be_nil
    expect(mars_rover.direction).to eq('N')
  end

  it 'receives an array of commands from Earth' do
    mars_rover = MarsRover.new
    expect(mars_rover).to respond_to(:execute).with(1).argument
  end

  it 'increases y position and stays in the same x position when moving forward'

  it 'decreases y position and stays in the same x position when moving backwards'
end