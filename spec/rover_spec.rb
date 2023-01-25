require 'rspec'
require 'movement'
require_relative '../lib/movement'

RSpec.describe do
  context 'the rover moves facing north' do
    it 'moves forward 1' do
      expect(Movement.new.execute('f', 'n', 0, 0)).to eq([0, 1])
    end

    it 'moves backward 1' do
      expect(Movement.new.execute('b', 'n', 0, 0)).to eq([0, -1])
    end

    it 'ends where we started' do
      expect(Movement.new.execute('bfbf', 'n', 0, 0)).to eq([0, 0])
    end
  end

  context 'rover faces south' do
    it 'moves forward 1' do
      expect(Movement.new.execute('f', 's', 0, 0)).to eq([0, -1])
    end

    it 'moves backward 1' do
      expect(Movement.new.execute('b', 's', 0, 0)).to eq([0, 1])
    end

    it 'ends where we started' do
      expect(Movement.new.execute('bfbf', 's', 0, 0)).to eq([0, 0])
    end
  end

  context 'rover faces east' do
    it 'moves east 1' do
      expect(Movement.new.execute('f', 'e', 0, 0)).to eq([1, 0])
    end

    it 'moves backward 1' do
      expect(Movement.new.execute('b', 'e', 0, 0)).to eq([-1, 0])
    end

    it 'ends where we started' do
      expect(Movement.new.execute('bfbf', 'e', 0, 0)).to eq([0, 0])
    end
  end

  context 'rover faces west' do
    it 'moves west 1' do
      expect(Movement.new.execute('f', 'w', 0, 0)).to eq([-1, 0])
    end

    it 'moves backward 1' do
      expect(Movement.new.execute('b', 'w', 0, 0)).to eq([1, 0])
    end

    it 'ends where we started' do
      expect(Movement.new.execute('bfbf', 'w', 0, 0)).to eq([0, 0])
    end
  end
end
