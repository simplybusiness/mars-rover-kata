require 'ostruct'
require_relative '../lib/mars_rover'

describe '1+1' do
  it 'equals 2' do

    expect(1+1).to eq(2)
  end
end

describe 'on bootup' do
  it 'starts at the origin and faces N' do
    rover = MarsRover.new(OpenStruct.new(x: 0, y: 0), 'N')

    coords = OpenStruct.new(x: 0, y: 0)
    expect(rover.starting_point).to eq([coords.x, coords.y])
    expect(rover.direction).to eq('N')
  end

  it 'does not start at the origin and faces N' do
    rover = MarsRover.new(OpenStruct.new(x: 1, y: 1), 'N')

    expect(rover.starting_point).to eq([1, 1])
  end

  it 'is facing W' do
    rover = MarsRover.new(OpenStruct.new(x: 0, y: 0), 'W')

    expect(rover.direction).to eq('W')
  end
  
  it 'receives commands from earth' do
    rover = MarsRover.new(OpenStruct.new(x: 0, y: 0), 'W')
    
    expect(rover).to respond_to(:execute)
  end
end