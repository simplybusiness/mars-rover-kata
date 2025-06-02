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
    it "moves forward and stays within the grid" do
      mars_rover = rover.execute("f")

      expect(mars_rover.x).to be == 1
      expect(mars_rover.y).to be == 3
      expect(mars_rover.direction).to be == "N"
    end

    # it "moves forward which would cause the rover to go out of bounds" do
      
  end
end