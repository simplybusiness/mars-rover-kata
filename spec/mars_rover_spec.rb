require 'rspec'
require_relative '../mars_rover'

RSpec.describe MarsRover do
  let(:rover) {MarsRover.new(0,0,"N")}

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
      expect(rover.x).to eq(0)
    end

    it 'moves the rover backwards by one space' do
      rover.execute("b")
      expect(rover.y).to eq(-1)
      expect(rover.x).to eq(0)
    end

    it 'move multiple steps forward' do
      rover.execute("fff")
      expect(rover.y).to eq(3)
      expect(rover.x).to eq(0)
    end

    it 'moves mulitple steps back' do
      rover.execute("bbb")
      expect(rover.y).to eq(-3)
      expect(rover.x).to eq(0)
    end

    xit 'the mars rover will refuse to execute the command if there is an unknown character' do
      expect(rover.message).to eq "Unknown instruction in the command, please review and resend"
    end
  end
end
