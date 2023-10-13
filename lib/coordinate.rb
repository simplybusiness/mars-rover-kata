class Coordinate
  attr_accessor :x, :y

  def initialize(x_pos: 0, y_pos: 0)
    @x = x_pos
    @y = y_pos
  end
end
