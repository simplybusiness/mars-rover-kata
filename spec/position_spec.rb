require_relative 'spec_helper'

describe Position do
  it 'has a starting position' do
    x = 0
    y = 0

    expect(described_class.new(x: x, y: y).x).to eq x
    expect(described_class.new(x: x, y: y).y).to eq y
  end

  it 'adds 1 to y' do
    x = 0
    y = 0

    expect(described_class.new(x: x, y: y).up.y).to eq 1
  end
end
