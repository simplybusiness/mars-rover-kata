require 'pry'
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

  it 'increases Y position and stays in the same X position when moving forward and facing North' do
    # execute f while facing north, will y++ & x stay the same
    
    mars_rover = MarsRover.new(x: 0, y: 0, direction: 'N')
    mars_rover.execute(['f'])
    expect(mars_rover.y).to eq(1)
    expect(mars_rover.x).to eq(0)
  end

  it 'increases Y facing N starting from 0,2' do
    mars_rover = MarsRover.new(x: 0, y: 2, direction: 'N')
    mars_rover.execute(['f'])
    expect(mars_rover.y).to eq(3)
    expect(mars_rover.x).to eq(0)
  end

  it 'Moves forward with starting point of 1,2' do
    mars_rover = MarsRover.new(x: 1, y: 2, direction: 'N')
    mars_rover.execute(['f'])
    expect(mars_rover.y).to eq(3)   
    expect(mars_rover.x).to eq(1)   
  end

  mars_rover = [MarsRover.new(x: 0, y: 0, direction: 'N')]
  expected_anwers = [[0,1], [1,0]]
  it 'Moves forward facing north without changing its X position' do
    mars_rover.each do |mr| 
      mr.execute(['f'])
      expect(mr.x).to eq(expected_anwers[0][0])
      expect(mr.y).to eq(expected_anwers[0][1])
    end
  end

  it 'increases X position and stays the same Y position when moving forward and facing East'
  
  it 'decreases X position and stays the same Y position when moving forward and facing West'

  it 'decreases Y position and stays in the same X position when moving forward and facing South'
end