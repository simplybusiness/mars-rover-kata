# Description: This class represents a position on a x,y grid
class Position
  attr_accessor :x, :y

  def initialize(x: 0, y: 0)
    raise 'Invalid position, x must be an integer' unless x.is_a? Integer

    @x = x
    @y = y
  end

  def inspect
    "(#{@x}, #{@y})"
  end
end
