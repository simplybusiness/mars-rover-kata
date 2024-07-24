class StartingPoint
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end

  def inspect
    "a starting point located at #{x}, #{y}"
  end
end
