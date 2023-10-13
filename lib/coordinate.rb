class Coordinate
  attr_accessor :x, :y, :x_position, :y_position

  def initialize(x = 0, y = 0, x_pos: 0, y_pos: 0)
    @x = x_pos
    @y = y_pos
    @x_position = x
    @y_position = y
  end
end
