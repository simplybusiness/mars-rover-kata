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
end

def coordinate
  Coordinate.new(x, y)
end
