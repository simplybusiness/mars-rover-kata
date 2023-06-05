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
    expect(rover.current_position).to eq([coords.x, coords.y])
    expect(rover.direction).to eq('N')
  end

  it 'does not start at the origin and faces N' do
    rover = MarsRover.new(OpenStruct.new(x: 1, y: 1), 'N')

    expect(rover.current_position).to eq([1, 1])
  end

  it 'is facing W' do
    rover = MarsRover.new(OpenStruct.new(x: 0, y: 0), 'W')

    expect(rover.direction).to eq('W')
  end
  
  it 'receives commands from earth' do
    rover = MarsRover.new(OpenStruct.new(x: 0, y: 0), 'W')
    
    expect(rover).to respond_to(:execute)
  end

  it 'moves forward when facing north' do
    rover = MarsRover.new(OpenStruct.new(x: 0, y: 0), 'N')
    rover.execute("f")

    expect(rover.current_position).to eq([0, 1])
  end

  it 'moves forward when facing north and away from the origin' do
    rover = MarsRover.new(OpenStruct.new(x: 3, y: 2), 'N')
    rover.execute("f")

    expect(rover.current_position).to eq([3, 3])
  end

  it 'moves forward when facing south' do
    rover = MarsRover.new(OpenStruct.new(x:0, y:0), 'S')
    rover.execute("f")

    expect(rover.current_position).to eq([0, -1])
  end

  it 'moves forward when facing west'
  it 'moves forward when facing east'
  it 'moves backward when facing north'
  it 'moves backward when facing south'
  it 'moves backward when facing west'
  it 'moves backward when facing east'


end