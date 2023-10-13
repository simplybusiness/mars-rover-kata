class Coordinate
  attr_accessor :x, :y

  def initialize(x = 0, y = 0, x_pos: 0, y_pos: 0)
    @x = x_pos
    @y = y_pos
  end

  def x_position
    @x
  end

  def y_position
    @y
  end
end
