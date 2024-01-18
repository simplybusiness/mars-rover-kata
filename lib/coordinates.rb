class Coordinates
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(coordinates)
    @y == coordinates.y
  end

  def inspect
    "(#{x}, #{y})"
  end
end
