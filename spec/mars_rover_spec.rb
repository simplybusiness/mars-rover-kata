require_relative "spec_helper"
require_relative "../lib/mars_rover"

describe MarsRover do
  describe "initialisation" do
    it "raise Argument error if starting point is not given upon initialisation" do
      expect { MarsRover.new }.to raise_error(ArgumentError)
    end

    it "starting point is correct given coordinates" do
      test_mars_rover_1 = MarsRover.new("N", [5, 6])
      expect(test_mars_rover_1.coordinates).to eq([5, 6])

      test_mars_rover_2 = MarsRover.new( "N", [3, 5])
      expect(test_mars_rover_2.coordinates).to eq([3, 5])
    end

    it "starting point coordinates should be array of integers" do
      expect { MarsRover.new("N", 3) }.to raise_error(ArgumentError)
      expect { MarsRover.new("N", ["a", 5]) }.to raise_error(ArgumentError)
      expect { MarsRover.new("N", [5, "c"]) }.to raise_error(ArgumentError)
      expect { MarsRover.new("N", ["a", "c"]) }.to raise_error(ArgumentError)
    end

    it "starting point coordinates should not be negative" do
      expect { MarsRover.new("N", [-6, -5]) }.to raise_error(ArgumentError)
    end

    it "directions should be provided" do
      expect { MarsRover.new([5,7]) }.to raise_error(ArgumentError)
    end

    it "directions should be either N, S, W, E" do
      expect { MarsRover.new("A", [9, 0]) }.to raise_error(ArgumentError)

      test_mars_rover = MarsRover.new("N", [8, 9])
      expect(test_mars_rover.direction).to eq("N")
    end
  end

  describe 'receiving commands from earth' do
    it 'receives commands from earth' do
      mars_rover = MarsRover.new('N')

      expect(mars_rover).to respond_to(:execute).with(1)
    end

    it 'moves forward one step if command is f' do
      mars_rover = MarsRover.new('N')
      forward_command = ['f']
      mars_rover.execute(forward_command)
      expect(mars_rover.coordinates).to eq([0, 1])
    end

    it 'moves upwards one step when command is f and facing north' do
      mars_rover = MarsRover.new('N', [0, 1])
      mars_rover.execute(['f'])

      expect(mars_rover.coordinates).to eq([0, 2])
    end

    it 'moves downwards one step when command is f and facing south' do
      mars_rover = MarsRover.new('S', [0, 1])
      mars_rover.execute(['f'])

      expect(mars_rover.coordinates).to eq([0, 0])
    end

    it 'moves leftwards one step when command is f and facing west' do
      mars_rover = MarsRover.new('W', [1, 1])
      mars_rover.execute(['f'])

      expect(mars_rover.coordinates).to eq([0, 1])
    end

    it 'moves rightwards one step when command is f and facing east' do
      mars_rover = MarsRover.new('E', [1, 1])
      mars_rover.execute(['f'])

      expect(mars_rover.coordinates).to eq([2, 1])
    end

  end

end
