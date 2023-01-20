require 'rspec'
require_relative '../mars_rover'

RSpec.describe MarsRover do
  let(:rover) {MarsRover.new(0,0,"N")}
  let(:commands) {"fff"}
  let(:complex_command) {"flfrb"} # You end in (-1, 0, "N")

  describe 'position' do
    it 'returns x' do
      expect(rover.x).to eq(0)
    end

    it 'returns y' do
      expect(rover.y).to eq(0)
    end

    it 'returns North' do
      expect(rover.orientation).to eq("N")
    end
  end

  describe 'movement for a North facing Mars Rover' do
    it 'moves the rover forward by one space' do
      rover.execute("f")
      expect(rover.y).to eq(1)
    end

    it 'moves the rover backwards by one space' do
      rover.execute("b")
      expect(rover.y).to eq(-1)
    end
  end
end
