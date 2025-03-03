require_relative '../lib/rover'

RSpec.describe 'Rover' do
  it 'should initialize with a position and direction' do
    rover = Rover.new([1, 2], 'N')
    expect(rover.position).to eq([1, 2])
    expect(rover.direction).to eq('N')
  end

  it 'should throw an error if initialised with an invalid position' do 
    expect { Rover.new([1, 2, 3], 'N') }.to raise_error('Invalid position')    
  end

  it 'should throw an error if initialised with no position' do 
    expect { Rover.new(nil, 'N') }.to raise_error('Invalid position')    
  end

  it 'should throw an error if initialised with an invalid direction' do
    expect { Rover.new([1, 2], 'Z') }.to raise_error('Invalid direction, must be one of N,S,W,E')
  end

  it 'should throw an error if initialised with no direction' do
    expect { Rover.new([1, 2], nil) }.to raise_error('Invalid direction, must be one of N,S,W,E')
  end
end
