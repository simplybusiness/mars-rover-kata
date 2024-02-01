require_relative "spec_helper"
require_relative "../lib/mars_rover"

describe MarsRover do
  describe "initialisation" do
    it "raise Argument error if starting point is not given upon initialisation" do
      expect { MarsRover.new }.to raise_error(ArgumentError)
    end

    it "starting point is correct given coordinates" do
      test_mars_rover_1 = MarsRover.new("N", [5, 6])
      expected_coordinates_1 = Coordinates.new(x: 5, y: 6)
      expect(test_mars_rover_1).to be_at(expected_coordinates_1)

      test_mars_rover_2 = MarsRover.new( "N", [3, 5])
      expected_coordinates_2 = Coordinates.new(x: 3, y: 5)
      expect(test_mars_rover_2).to be_at(expected_coordinates_2)
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

    context 'when command is f' do
      it 'moves forward one step if command is f' do
        mars_rover = MarsRover.new('N')
        forward_command = ['f']
        mars_rover.execute(forward_command)
        expected_coordinates = Coordinates.new(x: 0, y: 1)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves upwards one step when command is f and facing north' do
        mars_rover = MarsRover.new('N', [0, 1])
        mars_rover.execute(['f'])
        expected_coordinates = Coordinates.new(x: 0, y: 2)

        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves downwards one step when command is f and facing south' do
        mars_rover = MarsRover.new('S', [0, 1])
        mars_rover.execute(['f'])
        expected_coordinates = Coordinates.new(x: 0, y: 0)

        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves leftwards one step when command is f and facing west' do
        mars_rover = MarsRover.new('W', [1, 1])
        mars_rover.execute(['f'])
        expected_coordinates = Coordinates.new(x: 0, y: 1)

        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves rightwards one step when command is f and facing east' do
        mars_rover = MarsRover.new('E', [1, 1])
        mars_rover.execute(['f'])
        expected_coordinates = Coordinates.new(x: 2, y: 1)

        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves upwards three steps when command is fff and facing north' do
        mars_rover = MarsRover.new('N', [0, 0])
        mars_rover.execute(['f', 'f', 'f'])
        expected_coordinates = Coordinates.new(x: 0, y: 3)
        expect(mars_rover).to be_at(expected_coordinates)
      end
    end

    context 'when command is b' do
      it 'moves downwards one step when command is b and facing north' do
        mars_rover = MarsRover.new('N', [1, 1])
        mars_rover.execute(['b'])
        expected_coordinates = Coordinates.new(x: 1, y: 0)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves upwards one step when command is b and facing south' do
        mars_rover = MarsRover.new('S', [1, 1])
        mars_rover.execute(['b'])
        expected_coordinates = Coordinates.new(x: 1, y: 2)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves rightwards one step when command is b and facing west' do
        mars_rover = MarsRover.new('W', [1, 1])
        mars_rover.execute(['b'])
        expected_coordinates = Coordinates.new(x: 2, y: 1)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves leftwards one step when command is b and facing east' do
        mars_rover = MarsRover.new('E', [1, 1])
        mars_rover.execute(['b'])
        expected_coordinates = Coordinates.new(x: 0, y: 1)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves downwards three steps when command is bbb and facing north' do
        mars_rover = MarsRover.new('N', [3, 3])
        mars_rover.execute(['b', 'b', 'b'])
        expected_coordinates = Coordinates.new(x: 3, y: 0)

        expect(mars_rover).to be_at(expected_coordinates)
      end
    end

    context 'when command is l' do
      it 'moves leftwards one step when command is l and facing north' do
        mars_rover = MarsRover.new('N', [1, 1])
        mars_rover.execute(['l'])
        expected_coordinates = Coordinates.new(x: 0, y: 1)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves rightwards one step when command is l and facing south' do
        mars_rover = MarsRover.new('S', [1, 1])
        mars_rover.execute(['l'])
        expected_coordinates = Coordinates.new(x: 2, y: 1)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves downwards one step when command is l and facing west' do
        mars_rover = MarsRover.new('W', [1, 1])
        mars_rover.execute(['l'])
        expected_coordinates = Coordinates.new(x: 1, y: 0)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves upwards one step when command is l and facing east' do
        mars_rover = MarsRover.new('E', [1, 1])
        mars_rover.execute(['l'])
        expected_coordinates = Coordinates.new(x: 1, y: 2)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves leftwards three steps when command is lll and facing north' do
        mars_rover = MarsRover.new('N', [3, 3])
        mars_rover.execute(['l', 'l', 'l'])
        expected_coordinates = Coordinates.new(x: 0, y: 3)

        expect(mars_rover).to be_at(expected_coordinates)
      end
    end

    context 'when command is r' do
      it 'moves rightwards one step when command is r and facing north' do
        mars_rover = MarsRover.new('N', [1, 1])
        mars_rover.execute(['r'])
        expected_coordinates = Coordinates.new(x: 2, y: 1)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves leftwards one step when command is r and facing south' do
        mars_rover = MarsRover.new('S', [1, 1])
        mars_rover.execute(['r'])
        expected_coordinates = Coordinates.new(x: 0, y: 1)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves upwards one step when command is r and facing west' do
        mars_rover = MarsRover.new('W', [1, 1])
        mars_rover.execute(['r'])
        expected_coordinates = Coordinates.new(x: 1, y: 2)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves downwards one step when command is r and facing east' do
        mars_rover = MarsRover.new('E', [1, 1])
        mars_rover.execute(['r'])
        expected_coordinates = Coordinates.new(x: 1, y: 0)
        expect(mars_rover).to be_at(expected_coordinates)
      end

      it 'moves rightwards three steps when command is rrr and facing north' do
        mars_rover = MarsRover.new('N', [3, 3])
        mars_rover.execute(['r', 'r', 'r'])
        expected_coordinates = Coordinates.new(x: 6, y: 3)

        expect(mars_rover).to be_at(expected_coordinates)
      end
    end
  end

  RSpec::Matchers.define :be_at do |coordinates|
    match do |mars_rover|
      mars_rover.coordinates == coordinates
    end
  end
end
