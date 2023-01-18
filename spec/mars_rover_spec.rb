require_relative 'spec_helper'

describe MarsRover do
  let(:mars_rover) { described_class.new(x: x, y: y, facing_direction: facing_direction, commands: commands) }

  context 'initial start' do
    let(:x) { 0 }
    let(:y) { 0 }
    let(:facing_direction) { 'N' }
    let(:commands) { [] }

    it 'has a starting position' do
      expect(mars_rover.position.x).to eq x
      expect(mars_rover.position.y).to eq y
    end

    it 'has a starting direction' do
      expect(mars_rover.direction.facing_direction).to eq facing_direction
    end
  end
  
  context 'when moving forward' do
    let(:x) { 0 }
    let(:y) { 1 }
    let(:facing_direction) { 'N' }
    let(:commands) { ['f'] }

    it 'moves forward by 1' do
      mars_rover.move

      expect(mars_rover.position.x).to eq x
      expect(mars_rover.position.y).to eq y
    end
  end
end
