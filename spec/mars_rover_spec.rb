require 'rspec'
require_relative '../coordinates'
require_relative '../mars_rover'

RSpec.describe MarsRover do

  describe 'position' do
    it 'knows its current position' do
      expect(mars_rover.position).to eq(Coordinates.new(x: 0, y: 0))
    end

    it 'returns North' do
      expect(mars_rover.orientation).to eq("N")
    end

    it 'can return its full position of both coordinates and orientation' do
      expect(mars_rover).to eq(MarsRover.new(x: 0, y: 0, orientation: "N"))
    end

    def mars_rover
      MarsRover.new(x: 0, y: 0, orientation: "N")
    end
  end

  describe 'a North facing Mars Rover can move forwards or backwards' do
    it 'moves the rover forward by one space' do
      mars_rover = north_facing_rover

      mars_rover.execute_single_movement_action("f")

      expect(mars_rover.position).to eq(Coordinates.new(x: 0, y: 1))
    end

    it 'move multiple steps forward' do
      mars_rover = north_facing_rover

      mars_rover.process_movement_commands("fff")

      expect(mars_rover.position).to eq(Coordinates.new(x: 0, y:3))
    end

    it 'moves the rover backwards by one space' do
      mars_rover = north_facing_rover

      mars_rover.execute_single_movement_action("b")

      expect(mars_rover.position).to eq(Coordinates.new(x: 0, y: -1))
    end

    it 'moves mulitple steps back' do
      mars_rover = north_facing_rover

      mars_rover.process_movement_commands("bbb")

      expect(mars_rover.position).to eq(Coordinates.new(x: 0, y: -3))
    end

    def north_facing_rover
      MarsRover.new(x: 0, y: 0, orientation: "N")
    end
  end

  describe 'a East facing Mars Rover can move forwards or backwards' do
    it 'moves the rover forward by one space' do
      mars_rover = east_facing_rover

      mars_rover.execute_single_movement_action("f")

      expect(mars_rover.position). to eq(Coordinates.new(x:1, y:0))
    end

    it 'moves multiples step forward' do
      mars_rover = east_facing_rover

      mars_rover.process_movement_commands("fff")

      expect(mars_rover.position).to eq(Coordinates.new(x:3, y:0))
    end

    it 'moves the rover backwards by one space' do
      mars_rover = east_facing_rover

      mars_rover.execute_single_movement_action("b")

      expect(mars_rover.position).to eq(Coordinates.new(x:-1, y:0))
    end

    it 'moves multiples steps backwards' do
      mars_rover = east_facing_rover

      mars_rover.process_movement_commands("bbb")

      expect(mars_rover.position).to eq(Coordinates.new(x:-3, y:0))
    end

    def east_facing_rover
      MarsRover.new(x: 0, y: 0, orientation: "E")
    end
  end
  
  describe 'a South facing Mars Rover can move forwards or backwards' do
    it 'moves the rover forward by one space' do
      mars_rover = south_facing_rover

      mars_rover.execute_single_movement_action("f")

      expect(mars_rover.position).to eq(Coordinates.new(x:0, y:-1))
    end

    it 'moves the rover multiples steps forward' do
      mars_rover = south_facing_rover

      mars_rover.process_movement_commands("fff")

      expect(mars_rover.position).to eq(Coordinates.new(x:0, y:-3))
    end

    it 'moves the rover backwards by one space' do
      mars_rover = south_facing_rover

      mars_rover.execute_single_movement_action("b")

      expect(mars_rover.position).to eq(Coordinates.new(x:0, y:1))
    end

    it 'moves the rover multiples steps backwards' do
      mars_rover = south_facing_rover

      mars_rover.process_movement_commands("bbb")

      expect(mars_rover.position).to eq(Coordinates.new(x:0, y:3))
    end

    def south_facing_rover
      MarsRover.new(x:0, y:0, orientation: 'S')
    end
  end

  describe 'a West facing Mars Rover can move forwards or backwards' do
    it 'moves the rover forward by one space' do
      mars_rover = west_facing_rover

      mars_rover.execute_single_movement_action("f")

      expect(mars_rover.position).to eq(Coordinates.new(x:-1, y:0))
    end

    it 'moves the rover multiple steps forward' do
      mars_rover = west_facing_rover

      mars_rover.process_movement_commands("fff")

      expect(mars_rover.position).to eq(Coordinates.new(x:-3, y:0))
    end

    it 'moves the rover backwards by one space' do
      mars_rover = west_facing_rover

      mars_rover.execute_single_movement_action("b")

      expect(mars_rover.position).to eq(Coordinates.new(x:1, y:0))
    end

    it 'moves the rover multiples steps backwards' do
      mars_rover = west_facing_rover

      mars_rover.process_movement_commands("bbb")

      expect(mars_rover.position).to eq(Coordinates.new(x:3, y:0))
    end

    def west_facing_rover
      MarsRover.new(x:0, y:0, orientation: 'W')
    end
  end

  describe 'the Mars Rover can rotate to the right' do
    it 'rotates to the right going from facing North to facing East' do
      mars_rover = MarsRover.new(x: 0, y: 0, orientation: "N")

      mars_rover.execute_single_movement_action("r")

      expect(mars_rover.orientation).to eq("E")
    end

    it 'rotates to the right going from facing East to facing South' do
      mars_rover = MarsRover.new(x: 0, y: 0, orientation: "E")

      mars_rover.execute_single_movement_action("r")

      expect(mars_rover.orientation).to eq("S")
    end

    it 'rotates to the right going from facing South to facing West' do
      mars_rover = MarsRover.new(x: 0, y: 0, orientation: "S")

      mars_rover.execute_single_movement_action("r")

      expect(mars_rover.orientation).to eq("W")
    end

    it 'rotates to the right going from facing West to facing North' do
      mars_rover = MarsRover.new(x: 0, y: 0, orientation: "W")

      mars_rover.execute_single_movement_action("r")

      expect(mars_rover.orientation).to eq("N")
    end

    it 'can peform a full rotation clockwise' do
      mars_rover = MarsRover.new(x:0, y:0, orientation: "N")
      
      mars_rover.process_movement_commands("rrrr")

      expect(mars_rover.orientation).to eq("N")
    end
  end

  describe 'the Mars Rover can rotate to the left' do
    it 'rotates to the left going from facing North to facing West' do
      mars_rover = MarsRover.new(x: 0, y: 0, orientation: "N")

      mars_rover.execute_single_movement_action("l")

      expect(mars_rover.orientation).to eq("W")
    end

    it 'rotates to the left going from facing West to facing South' do
      mars_rover = MarsRover.new(x: 0, y: 0, orientation: "W")

      mars_rover.execute_single_movement_action("l")

      expect(mars_rover.orientation).to eq("S")
    end

    it 'rotates to the left going from facing South to facing East' do
      mars_rover = MarsRover.new(x: 0, y: 0, orientation: "S")

      mars_rover.execute_single_movement_action("l")

      expect(mars_rover.orientation).to eq("E")
    end

    it 'rotates to the left going from facing East to facing North' do
      mars_rover = MarsRover.new(x: 0, y: 0, orientation: "E")

      mars_rover.execute_single_movement_action("l")

      expect(mars_rover.orientation).to eq("N")
    end

    it 'can perform a full rotation anti clockwise' do
      mars_rover = MarsRover.new(x:0, y:0, orientation: "N")
      
      mars_rover.process_movement_commands("llll")

      expect(mars_rover.orientation).to eq("N")
    end
  end

  describe 'will process orders containing both movement and rotations' do
    it 'can execute an order that contains both movement and rotation' do
      mars_rover = MarsRover.new(x:0, y:0, orientation: "N")

      mars_rover.process_movement_commands("frflbr")

      expect(mars_rover).to eq(MarsRover.new(x:1, y:0, orientation: "E"))
    end
  end

  describe 'will do nothing given an invalid movement option' do
    it 'will ignore an unknown command' do
      mars_rover = MarsRover.new(x:0, y:0, orientation: "N")

      mars_rover.process_movement_commands("x")

      expect(mars_rover.position).to eq(Coordinates.new(x:0, y:0))
    end
  end
end
