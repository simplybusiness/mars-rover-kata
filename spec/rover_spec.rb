require_relative '../lib/rover'

RSpec.describe 'Rover' do
  it 'should initialize with a position and direction' do
    rover = Rover.new([1, 2], 'N')
    expect(rover.position).to eq([1, 2])
    expect(rover.direction).to eq('N')
  end

  it 'should throw an error if initialised with an invalid position'
  it 'should throw an error if initialised with an invalid direction'
end
