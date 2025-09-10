class Coordinates

  attr_reader :x_coordinate, :y_coordinate

  def initialize(x, y)
    @x_coordinate = x
    @y_coordinate = y
  end

  def inspect
    "(#{@x_coordinate}, #{@y_coordinate})"
  end

  def ==(other)
    @x_coordinate == other.x_coordinate && @y_coordinate == other.y_coordinate
  end
end