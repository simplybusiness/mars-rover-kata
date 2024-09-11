class StartingPoint
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = validate_starting_point(x)
    @y = validate_starting_point(y)
  end

  def validate_starting_point(coordinate)
    coordinate.to_i
  end

  def inspect
    "a starting point located at #{x}, #{y}"
  end
end
