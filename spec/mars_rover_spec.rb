require_relative 'spec_helper'

describe MarsRover do
  context 'initial start' do
    let(:x) { 0 }
    let(:y) { 0 }
    let(:facing_direction) { 'N' }
    let(:commands) { [] }
    let(:mars_rover) { described_class.new(x: x, y: y, facing_direction: facing_direction, commands: commands) }

    it 'has a starting position' do
      expect(mars_rover.position.x).to eq x
      expect(mars_rover.position.y).to eq y
    end

    it 'has a starting direction' do
      expect(mars_rover.direction.facing_direction).to eq facing_direction
    end
  end
end
