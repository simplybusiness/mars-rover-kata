#   +---+---+---+---+---+---+---+---+---+---+
# 9 | . | . | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
# 8 | . | . | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
# 7 | . | . | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
# 6 | . | . | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
# 5 | . | . | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
# 4 | . | . | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
# 3 | . | . | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
# 2 | . | X | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
# 1 | . | . | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
# 0 | . | . | . | . | . | . | . | . | . | . |
#   +---+---+---+---+---+---+---+---+---+---+
#     0   1   2   3   4   5   6   7   8   9

require_relative '../mars_rover'


describe "Initialisation" do
  it "creates a rover with the correct initial state" do
    rover = MarsRover.new(2, 2, "N")

    expect(rover.x).to be == 2
    expect(rover.y).to be == 2
    expect(rover.direction).to be == "N"
  end

  context "with invalid parameters" do
    [{x: 23, y: 5}].each do |position|
      it "raises an error if the x coordinate is out of bounds starting at (#{position[:x]}, #{position[:y]})" do
        expect { MarsRover.new(position[:x], position[:y], "N") }.to raise_error(ArgumentError, "x-coordinate is outside the grid")
      end
    end
    
    it "raises an error if the y coordinate is out of bounds" do
      expect{ MarsRover.new(3, 15, "N") }
        .to raise_error(ArgumentError, "y-coordinate is outside the grid")
    end

    it "raises an error if the direction is invalid" do
      expect{ MarsRover.new(3, 5, "X") }
        .to raise_error(ArgumentError, "Direction is invalid")
    end
  end
end

describe "Executing commands" do
  let(:rover) { MarsRover.new(1, 2, "N")}

  context "move Rover forward" do
    it "moves forward in the North direction and stay within the grid" do
      mars_rover = rover.execute("f")

      expect(mars_rover.x).to be == 1
      expect(mars_rover.y).to be == 3
      expect(mars_rover.direction).to be == "N"
    end

    it "moves forward in the North direction which would cause the rover to go out of bounds" do
      rover = MarsRover.new(2, 10, "N")

      expect { rover.execute("f") }.to raise_error(ArgumentError, "Rover will go out of bounds")
    end

    it "moves forward in the East direction and stay within the grid" do
      rover = MarsRover.new(1, 2, "E")
      rover = rover.execute("f")

      expect(rover.x).to be == 2
      expect(rover.y).to be == 2
      expect(rover.direction).to be == "E"
    end

    it "moves forward in the East direction which would cause the rover to go out of bounds" do
      rover = MarsRover.new(10, 2, "E")

      expect { rover.execute("f") }.to raise_error(ArgumentError, "Rover will go out of bounds")
    end

    it "moves forward in the West direction and stay within the grid" do
      rover = MarsRover.new(1, 2, "W")
      rover = rover.execute("f")

      expect(rover.x).to be == 0
      expect(rover.y).to be == 2
      expect(rover.direction).to be == "W"
    end

    it "moves forward in the West direction which would cause the rover to go out of bounds" do
      rover = MarsRover.new(0, 2, "W")

      expect { rover.execute("f") }.to raise_error(ArgumentError, "Rover will go out of bounds")
    end

    it "moves forward in the South direction and stay within the grid" do
      rover = MarsRover.new(1, 2, "S")
      rover = rover.execute("f")

      expect(rover.x).to be == 1
      expect(rover.y).to be == 1
      expect(rover.direction).to be == "S"
    end

    it "moves forward in the South direction which would cause the rover to go out of bounds" do
      rover = MarsRover.new(1, 0, "S")

      expect { rover.execute("f") }.to raise_error(ArgumentError, "Rover will go out of bounds")
    end
      
  end
end