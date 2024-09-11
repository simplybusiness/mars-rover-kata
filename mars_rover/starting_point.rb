class StartingPoint
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = x.to_i
    @y = y.to_i
  end

  def inspect
    "a starting point located at #{x}, #{y}"
  end
end
