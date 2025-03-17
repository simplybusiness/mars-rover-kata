require_relative '../lib/position'

RSpec.describe 'Position' do
  context 'Position is initialized' do
    it 'should initialize and return [X,Y]' do
      position = Position.new(x: 1, y: 2)
      expect(position.x).to eq(1)
      expect(position.y).to eq(2)
    end

    it 'should initialize with default values' do
      position = Position.new
      expect(position.x).to eq(0)
      expect(position.y).to eq(0)
    end
  end

  context 'Position is changed' do
    it 'should be able to update x position' do
      position = Position.new
      position.x = 5
      expect(position.x).to eq(5)
      expect(position.y).to eq(0)
    end

    it 'should be able to update y position' do
      position = Position.new
      position.y = 5
      expect(position.x).to eq(0)
      expect(position.y).to eq(5)
    end
  end

  context 'Check position is valid' do
    it 'should throw an error if x is not an integer' do
      expect { Position.new(x: 'a') }.to raise_error('Invalid position, x must be an integer')
    end
  end
end
