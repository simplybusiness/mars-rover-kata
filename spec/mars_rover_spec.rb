require_relative 'spec_helper'

describe MarsRover do
  it 'has a starting position' do
    x = 0
    y = 0
    facing_direction = 'N'

    expect(described_class.new(x: x, y: y, facing_direction: facing_direction).position.x).to eq x
    expect(described_class.new(x: x, y: y, facing_direction: facing_direction).position.y).to eq y
  end

  it 'has a starting direction' do
    x = 0
    y = 0
    facing_direction = 'N'

    expect(described_class.new(x: x, y: y, facing_direction: facing_direction).direction.facing_direction).to eq facing_direction
  end
end
