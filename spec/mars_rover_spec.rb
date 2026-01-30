RSpec.describe 'operating a mars rover' do
  it "has a starting position" do
    rover = MarsRover.new(0, 0)

    expect(rover.x_coordinate).to eq(0)
    expect(rover.y_coordinate).to eq(0)
  end
  it "has a starting direction" do
    rover = MarsRover.new(0, 0, direction: :north)

    expect(rover.direction).to eq(:north)
  end
  it "has a position on planet" do

    rover = MarsRover.new(1, 2)
    expect(rover.x_coordinate).to eq(1)
    expect(rover.y_coordinate).to eq(2)
  end
  it "has a valid direction"

end


class MarsRover

  attr_reader :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction: nil)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end
end