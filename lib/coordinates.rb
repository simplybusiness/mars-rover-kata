class Coordinates
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(other_coordinates)
    return false if ! other_coordinates.is_a?(Coordinates)

    y == other_coordinates.y && x == other_coordinates.x
  end

  def to_s
    "(#{@x},#{@y})"
  end

  def inspect
    "(#{@x},#{@y})"
  end
end