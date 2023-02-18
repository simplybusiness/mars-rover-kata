require 'rspec'
require_relative '../coordinates'
require_relative '../mars_rover'

RSpec.describe MarsRover do

  describe 'position' do
    it 'knows its current position' do
      expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
    end

    it 'returns North' do
      expect(rover.orientation).to eq("N")
    end

    def rover
      MarsRover.new(x: 0, y: 0, orientation: "N")
    end
  end

  describe 'movement for a North facing Mars Rover' do
    it 'moves the rover forward by one space' do
      rover = north_facing_rover

      rover.execute("f")

      expect(rover.position).to eq(Coordinates.new(x: 0, y: 1))
    end

    it 'moves the rover backwards by one space' do
      rover = north_facing_rover

      rover.execute("b")

      expect(rover.position).to eq(Coordinates.new(x: 0, y: -1))
    end

    it 'move multiple steps forward' do
      rover = north_facing_rover

      rover.execute("fff")

      expect(rover.position).to eq(Coordinates.new(x: 0, y: 3))
    end

    it 'moves mulitple steps back' do
      rover = north_facing_rover

      rover.execute("bbb")

      expect(rover.position).to eq(Coordinates.new(x: 0, y: -3))
    end

    def north_facing_rover
      MarsRover.new(x: 0, y: 0, orientation: "N")
    end
  end

  describe 'movement for a East facing Mars Rover' do
    it 'moves the rover forward by one space' do
      rover = east_facing_rover

      rover.execute("f")

      expect(rover.position).to eq(Coordinates.new(x: 1, y: 0))
    end

    it 'moves multiples step forward' do
      rover = east_facing_rover

      rover.execute("fff")

      expect(rover.position).to eq(Coordinates.new(x:3, y:0))
    end

    it 'moves the rover backwards by one space' do
      rover = east_facing_rover

      rover.execute("b")

      expect(rover.position).to eq(Coordinates.new(x:-1, y:0))
    end

    it 'moves multiples steps backwards' do
      rover = east_facing_rover

      rover.execute("bbb")

      expect(rover.position).to eq(Coordinates.new(x:-3, y:0))
    end

    def east_facing_rover
      MarsRover.new(x: 0, y: 0, orientation: "E")
    end
  end
  
  describe 'movement for a South facing Mars Rover' do
    it 'moves the rover forward by one space' do
      rover = south_facing_rover

      rover.execute("f")

      expect(rover.position).to eq(Coordinates.new(x:0, y:-1))
    end

    it 'moves the rover backwards by one space' do
      rover = south_facing_rover

      rover.execute("b")

      expect(rover.position).to eq(Coordinates.new(x:0, y:+1))
    end

    def south_facing_rover
      MarsRover.new(x:0, y:0, orientation: 'S')
    end
  end

  describe 'movement for a West facing Mars Rover' do
    it 'moves the rover forward by one space' do
      rover = west_facing_rover

      rover.execute("f")

      expect(rover.position).to eq(Coordinates.new(x:-1, y:0))
    end

    it 'moves the rover backwards by one space' do
      rover = west_facing_rover

      rover.execute("b")

      expect(rover.position).to eq(Coordinates.new(x:1, y:0))
    end

    def west_facing_rover
      MarsRover.new(x:0, y:0, orientation: 'W')
    end
  end

  describe 'the Mars Rover can rotate to the right' do
    it 'rotates to the right going from facing North to facing East' do
      rover = MarsRover.new(x: 0, y: 0, orientation: "N")

      rover.execute("r")

      expect(rover.orientation).to eq("E")
    end

    it 'rotates to the right going from facing East to facing South' do
      rover = MarsRover.new(x: 0, y: 0, orientation: "E")

      rover.execute("r")

      expect(rover.orientation).to eq("S")
    end

    it 'rotates to the right going from facing South to facing West' do
      rover = MarsRover.new(x: 0, y: 0, orientation: "S")

      rover.execute("r")

      expect(rover.orientation).to eq("W")
    end

    it 'rotates to the right going from facing West to facing North' do
      rover = MarsRover.new(x: 0, y: 0, orientation: "W")

      rover.execute("r")

      expect(rover.orientation).to eq("N")
    end
  end

  describe 'the Mars Rover can rotate to the left' do
    it 'rotates to the left going from facing North to facing West' do
      rover = MarsRover.new(x: 0, y: 0, orientation: "N")

      rover.execute("l")

      expect(rover.orientation).to eq("W")
    end
  end

  describe 'invalid movement options' do
    it 'will ignore an unknown command' do
      rover = MarsRover.new(x: 0, y: 0, orientation: "N")

      rover.execute("x")

      expect(rover.position).to eq(Coordinates.new(x:0, y:0))
    end
  end
end
