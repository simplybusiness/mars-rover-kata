class Coordinates
  attr_reader :x, :y

  WRAP_AROUND = 10

  def initialize(x:, y:)
    @x = x.modulo(WRAP_AROUND)
    @y = y.modulo(WRAP_AROUND)
  end

  def ==(point)
    @x == point.x && @y == point.y
  end

  def inspect
    "(#{x}, #{y})"
  end
end