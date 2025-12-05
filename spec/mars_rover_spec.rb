RSpec.describe 'operating a mars rover' do
  it "has a starting postition" do
    rover = MarsRover.new(0, 0)

    expect(rover.x_axis).to eq(0)
    expect(rover.y_axis).to eq(0)
  end
  it "has a starting direction"
  it "has a position on planet"
  it "has a valid direction"

end


class MarsRover


  def initialize(x_axis, y_axis)
    @x_axis = x_axis
    @y_axis = y_axis
  end

  def x_axis
    @x_axis
  end

  def y_axis
    @y_axis
  end

end