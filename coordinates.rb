class Coordinates
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(point)
    @x == point.x && @y == point.y
  end

  def inspect
    "(#{x}, #{y})"
  end
end