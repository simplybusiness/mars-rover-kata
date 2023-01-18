require 'rspec'
require_relative '../mars_rover'

RSpec.describe MarsRover do
  let(:rover) {MarsRover.new(2,0,"N")}
  describe 'x' do
    it 'returns x' do
      expect(rover.x).to eq(2)
    end
  end
  describe 'y' do
    it 'returns y' do
      expect(rover.y).to eq(0)
    end
  end
  describe 'orientation' do
    it 'returns North' do
      expect(rover.orientation).to eq("N")
    end
  end
  describe 'execute' do 
    it 'moves the rover forward by one space' do
      rover.execute(["f"])
      expect(rover.y).to eq(1)
    end
  end
end
