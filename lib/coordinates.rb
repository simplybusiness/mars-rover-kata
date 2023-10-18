class Coordinates
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(other_coordinates)
    true
  end

  def to_s
    "(#{@x},#{@y})"
  end

  def inspect
    "(#{@x},#{@y})"
  end
end