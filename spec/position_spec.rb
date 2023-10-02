require_relative 'spec_helper'

describe Position do
  let(:x) { 0 }
  let(:y) { 0 }
  let(:position) { described_class.new(x: x, y: y) }

  it 'has a starting position' do
    expect(position.x).to eq x
    expect(position.y).to eq y
  end

  it 'adds 1 to y' do
    expect(position.up.y).to eq 1
  end
end
