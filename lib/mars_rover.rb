class MarsRover

  attr_reader :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction: nil)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end
end