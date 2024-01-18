class Coordinates
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(coordinates)
    coordinates.is_a?(Coordinates) && @y == coordinates.y && @x == coordinates.x
  end

  def inspect
    "(#{x}, #{y})"
  end
end
