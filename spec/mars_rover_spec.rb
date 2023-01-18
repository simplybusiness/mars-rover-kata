require 'rspec'
require_relative '../mars_rover'

RSpec.describe MarsRover do
  describe 'x' do
    it 'returns x' do
      expect(MarsRover.new(2, 0).x).to eq(2)
    end
  end
  describe 'y' do
    it 'returns y' do
      expect(MarsRover.new(2, 0).y).to eq(0)
    end
  end
  
end
