class Point
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x_coordinate=0, y_coordinate=0)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end
end
