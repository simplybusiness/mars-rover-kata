require 'pry'
require_relative '../lib/compass.rb'

describe Compass do
  let(:direction) { "N" }

  it 'has starting direction' do
    expect(compass.direction).to eq "N" 
  end

  it 'goes left' do
    expect(compass.left.direction).to eq "W"
  end

  it 'goes left twice' do
    new_compass = compass.left

    expect(new_compass.left.direction).to eq "S"
  end

  it 'goes right' do
    expect(compass.right.direction).to eq "E"
  end

  it 'goes right twice' do
    new_compass = compass.right

    expect(new_compass.right.direction).to eq "S"
  end
end

def compass
  Compass.new(direction)
end
