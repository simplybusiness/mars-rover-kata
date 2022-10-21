require_relative '../lib/coordinate.rb'

describe Coordinate do
  let(:x) { 0 }
  let(:y) { 0 }

  it 'has starting coordinates' do
    expect(coordinate.x).to eq 0
    expect(coordinate.y).to eq 0
  end
end

def coordinate
  Coordinate.new(x, y)
end
