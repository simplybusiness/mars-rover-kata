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
    [{x: 23, y: 5}, {x: 3, y: 15}].each do |position|
      it "raises an error if the starting coordinate is out of bounds at (#{position[:x]}, #{position[:y]})" do
        expect { MarsRover.new(position[:x], position[:y], "N") }.to raise_error(ArgumentError, "Rover out of bounds, got {x: #{position[:x]}, y: #{position[:y]}}")
      end
    end

    it "raises an error if the direction is invalid" do
      expect{ MarsRover.new(3, 5, "X") }
        .to raise_error(ArgumentError, "Direction is invalid")
    end
  end
end

describe "Executing commands" do

  context "move Rover forward" do  
    it "moves forward in the North direction and stay within the grid" do
      rover = MarsRover.new(1, 2, "N")
      mars_rover = rover.execute("f")

      expected_location = Point.new(x: 1, y: 3)
      
      expect(mars_rover.direction).to be == "N"
      expect(mars_rover.current_location).to be == expected_location
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

  context "move Rover backwards" do  
    it "moves backward in the North direction and stay within the grid" do
      rover = MarsRover.new(1, 2, "N")
      mars_rover = rover.execute("b")

      expect(mars_rover.x).to be == 1
      expect(mars_rover.y).to be == 1
      expect(mars_rover.direction).to be == "N"
    end

    it "moves backward in the North direction whcih would cause the rover to go out of bounds" do
      rover = MarsRover.new(1, 0, "N")

      expect { rover.execute("b") }.to raise_error(ArgumentError, "Rover will go out of bounds")
    end


    it "moves backward in the East direction and stay within the grid" do
      rover = MarsRover.new(3, 2, "E")
      mars_rover = rover.execute("b")

      expect(mars_rover.x).to be == 2
      expect(mars_rover.y).to be == 2
      expect(mars_rover.direction).to be == "E"
    end

    it "moves backward in the East direction whcih would cause the rover to go out of bounds" do
      rover = MarsRover.new(0, 4, "E")

      expect { rover.execute("b") }.to raise_error(ArgumentError, "Rover will go out of bounds")
    end

    it "moves backward in the West direction and stay within the grid" do
      rover = MarsRover.new(3, 2, "W")
      mars_rover = rover.execute("b")

      expect(mars_rover.x).to be == 4
      expect(mars_rover.y).to be == 2
      expect(mars_rover.direction).to be == "W"
    end

    it "moves backward in the West direction whcih would cause the rover to go out of bounds" do
      rover = MarsRover.new(10, 4, "W")

      expect { rover.execute("b") }.to raise_error(ArgumentError, "Rover will go out of bounds")
    end

    it "moves backward in the South direction and stay within the grid" do
      rover = MarsRover.new(3, 2, "S")
      mars_rover = rover.execute("b")

      expect(mars_rover.x).to be == 3
      expect(mars_rover.y).to be == 3
      expect(mars_rover.direction).to be == "S"
    end

    it "moves backward in the East direction whcih would cause the rover to go out of bounds" do
      rover = MarsRover.new(3, 10, "S")

      expect { rover.execute("b") }.to raise_error(ArgumentError, "Rover will go out of bounds")
    end
    
  end
end