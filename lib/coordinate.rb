class Coordinate
  attr_accessor :x, :y, :x_position, :y_position

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
    @x_position = x
    @y_position = y
  end
end
