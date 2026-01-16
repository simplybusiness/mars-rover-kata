RSpec.describe 'operating a mars rover' do
  it "has a starting position" do
    rover = MarsRover.new(0, 0)

    expect(rover.x_coordinate).to eq(0)
    expect(rover.y_coordinate).to eq(0)
  end
  it "has a starting direction"
  it "has a position on planet"
  it "has a valid direction"

end


class MarsRover

  attr_reader :x_coordinate

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_axis = y_coordinate
  end

  def y_coordinate
    @y_axis
  end
end