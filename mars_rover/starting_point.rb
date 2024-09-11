class StartingPoint
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = validate_starting_point(x)
    @y = validate_starting_point(y)
  end

  def validate_starting_point(coordinate)
    if coordinate.is_a?(String)
      raise ArgumentError, "Coordinate must be an integer"
    end

    coordinate
  end

  def inspect
    "a starting point located at #{x}, #{y}"
  end
end
