require 'rspec'
require 'ostruct'
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

    it 'knows its current position' do
      expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: 0))
    end

    it 'returns North' do
      expect(rover.orientation).to eq("N")
    end
  end

  describe 'movement for a North facing Mars Rover' do
    it 'moves the rover forward by one space' do
      rover.execute("f")

      expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: 1))
    end

    it 'moves the rover backwards by one space' do
      rover.execute("b")

      expect(rover.coordinates).to eq(OpenStruct.new(x:0, y: -1))
    end

    it 'move multiple steps forward' do
      rover.execute("fff")

      expect(rover.coordinates).to eq(OpenStruct.new(x:0, y: 3))
    end

    it 'moves mulitple steps back' do
      rover.execute("bbb")

      expect(rover.coordinates).to eq(OpenStruct.new(x:0, y: -3))
    end

    it 'will ignore the unknown command' do
      rover.execute("u")

      expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: 0))
    end
  end

  describe 'movement for a East facing Mars Rover' do
    xit 'moves the rover forward by one space' do
      rover.execute("f")

      expect(rover.coordinates).to eq(OpenStruct.new(x: 1, y: 0))
    end
  end
end
