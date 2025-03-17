require_relative '../lib/position'

RSpec.describe 'Position' do
  context 'Position is initialized' do
    it 'should initialize and return [X,Y]' do
      position = Position.new(x: 1, y: 2)
      expect(position.x).to eq(1)
      expect(position.y).to eq(2)
    end
  end
end
