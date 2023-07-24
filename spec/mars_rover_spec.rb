require 'ostruct'
require_relative '../mars_rover'

describe 'Mars rover' do

  it 'has a starting point' do

    mars_rover = MarsRover.new
    expect(mars_rover.starting_point).to eq(OpenStruct.new(x: 0, y: 0))
  end

  it 'faces a particular direction (N, E, S, W)' do
    mars_rover = MarsRover.new
    expect(mars_rover.direction).to eq('N')
  end

  it 'faces any particular direction' do
    mars_rover = MarsRover.new
    mars_rover.direction = 'S'
    expect(mars_rover.direction).to eq('S')
  end
end
