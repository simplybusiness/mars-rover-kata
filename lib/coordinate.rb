class Coordinate
  attr_accessor :x, :y

  def initialize(x = 0, y = 0, x_pos: 0, y_pos: 0)
    @x = x
    @y = y
  end
end
