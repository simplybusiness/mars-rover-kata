class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def eq(x, y)
    true
    #@x == x && @y == y
  end
end