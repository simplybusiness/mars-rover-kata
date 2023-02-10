require 'rspec'
require_relative '../coordinates'
require_relative '../mars_rover'

RSpec.describe MarsRover do
  let(:rover) { MarsRover.new(x: 0, y: 0, orientation: "N") }

  describe 'position' do
    it 'knows its current position' do
      expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
    end

    it 'returns North' do
      expect(rover.orientation).to eq("N")
    end
  end

  describe 'movement for a North facing Mars Rover' do
    it 'moves the rover forward by one space' do
      rover.execute("f")

      expect(rover.position).to eq(Coordinates.new(x: 0, y: 1))
    end

    it 'moves the rover backwards by one space' do
      rover.execute("b")

      expect(rover.position).to eq(Coordinates.new(x: 0, y: -1))
    end

    it 'move multiple steps forward' do
      rover.execute("fff")

      expect(rover.position).to eq(Coordinates.new(x: 0, y: 3))
    end

    it 'moves mulitple steps back' do
      rover.execute("bbb")

      expect(rover.position).to eq(Coordinates.new(x: 0, y: -3))
    end

    it 'will ignore the unknown command' do
      rover.execute("u")

      expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
    end
  end

  describe 'movement for a East facing Mars Rover' do
    it 'moves the rover forward by one space' do
      rover = MarsRover.new(x: 0, y: 0, orientation: "E")

      rover.execute("f")

      expect(rover.position).to eq(Coordinates.new(x: 1, y: 0))
    end
  end
end
