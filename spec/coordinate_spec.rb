require 'pry'
require_relative '../lib/coordinate.rb'

describe Coordinate do
  let(:x) { 0 }
  let(:y) { 0 }

  it 'has starting coordinates' do
    expect(coordinate.x).to eq 0
    expect(coordinate.y).to eq 0
  end

  it 'adds 1 to y' do
    expect(coordinate.up.x).to eq 0
    expect(coordinate.up.y).to eq 1
  end

  it 'removes 1 to y' do
    expect(coordinate.down.x).to eq 0
    expect(coordinate.down.y).to eq -1
  end

  it 'adds 1 to x' do
    expect(coordinate.right.x).to eq 1
    expect(coordinate.right.y).to eq 0
  end

  it 'removes 1 to x' do
    expect(coordinate.left.x).to eq -1
    expect(coordinate.left.y).to eq 0
  end
end

def coordinate
  Coordinate.new(x, y)
end
