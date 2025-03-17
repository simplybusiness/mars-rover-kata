# Description: This class represents a position on a x,y grid
class Position
  attr_accessor :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end

  def inspect
    "(#{@x}, #{@y})"
  end
end
