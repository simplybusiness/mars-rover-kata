class Coordinates
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(coordinates)
    true
  end

  def inspect
    "(#{x}, #{y})"
  end
end
