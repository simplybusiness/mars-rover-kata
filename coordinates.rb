class Coordinates
  attr_reader :x, :y

  WRAP_AROUND_X = 10
  WRAP_AROUND_Y = 10

  def initialize(x:, y:)
    @x = x.modulo(WRAP_AROUND_X)
    @y = y.modulo(WRAP_AROUND_Y)
  end

  def ==(point)
    @x == point.x && @y == point.y
  end

  def inspect
    "(x: #{x}, y: #{y})"
  end
end