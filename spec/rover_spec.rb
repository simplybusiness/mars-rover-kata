require 'rspec'
require 'movement'
require_relative '../lib/movement'

RSpec.describe do
  context 'the rover moves facing north' do
    it 'moves forward 1' do
      expect(Movement.new.move('f', 'n', 0, 0)).to eq([0, 1])
    end

    it 'moves backward 1' do
      expect(Movement.new.move('b', 'n', 0, 0)).to eq([0, -1])
    end

    it 'ends where we started' do
      expect(Movement.new.move('bfbf', 'n', 0, 0)).to eq([0, 0])
    end
  end

  context 'rover faces south' do
    it 'moves forward 1' do
      expect(Movement.new.move('f', 's', 0, 0)).to eq([0, -1])
    end

    it 'moves backward 1' do
      expect(Movement.new.move('b', 's', 0, 0)).to eq([0, 1])
    end

    it 'ends where we started' do
      expect(Movement.new.move('bfbf', 's', 0, 0)).to eq([0, 0])
    end
  end

  context 'rover faces east' do
    it 'moves east 1' do
      expect(Movement.new.move('f', 'e', 0, 0)).to eq([1, 0])
    end

    it 'moves backward 1' do
      expect(Movement.new.move('b', 'e', 0, 0)).to eq([-1, 0])
    end

    it 'ends where we started' do
      expect(Movement.new.move('bfbf', 'e', 0, 0)).to eq([0, 0])
    end
  end

  context 'rover faces west' do
    it 'moves west 1' do
      expect(Movement.new.move('f', 'w', 0, 0)).to eq([-1, 0])
    end

    it 'moves backward 1' do
      expect(Movement.new.move('b', 'w', 0, 0)).to eq([1, 0])
    end

    it 'ends where we started' do
      expect(Movement.new.move('bfbf', 'w', 0, 0)).to eq([0, 0])
    end
  end

  context 'rover turns' do
    it 'turns left' do
      expect(Movement.turn('l', 'n')).to eq('w')
    end
  end
end
