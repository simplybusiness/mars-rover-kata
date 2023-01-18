require 'rspec'
require_relative '../mars_rover'

RSpec.describe MarsRover do
  describe 'x' do
    it 'returns x' do
      expect(position.x).to eq(2)
    end
  end
  describe 'y' do
    it 'returns y' do
      expect(position.y).to eq(0)
    end
  end
  describe 'orientation' do
    it 'returns North' do
      expect(position.orientation).to eq("N")
    end
  end
  describe 'execute' do 
    it'goes north when 
  end

  def position
    MarsRover.new(2,0,"N")
  end

end
