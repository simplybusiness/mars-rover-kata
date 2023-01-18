require_relative 'spec_helper'

describe MarsRover do
  context 'initial start' do
    let(:x) { 0 }
    let(:y) { 0 }
    let(:facing_direction) { 'N' }

    it 'has a starting position' do
      expect(described_class.new(x: x, y: y, facing_direction: facing_direction).position.x).to eq x
      expect(described_class.new(x: x, y: y, facing_direction: facing_direction).position.y).to eq y
    end

    it 'has a starting direction' do
      expect(described_class.new(x: x, y: y, facing_direction: facing_direction).direction.facing_direction).to eq facing_direction
    end
  end
end
