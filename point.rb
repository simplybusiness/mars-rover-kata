class Point
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  def ==(point)
    return false unless point.is_a? Point

    point.x_coordinate == x_coordinate && point.y_coordinate == y_coordinate
  end
end
