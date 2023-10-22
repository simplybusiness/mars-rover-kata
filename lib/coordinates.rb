class Coordinates
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def backwards(facing_direction)
    case facing_direction
    when 'N'
      Coordinates.new(x: x, y: y - 1)
    when 'E'
      Coordinates.new(x: x - 1, y: y)
    when 'S'
      Coordinates.new(x: x, y: y + 1)
    when 'W'
      Coordinates.new(x: x + 1, y: y)
    end
  end

  def ==(other_coordinates)
    self.class == other_coordinates.class && y == other_coordinates.y && x == other_coordinates.x
  end

  def to_s
    "(#{@x},#{@y})"
  end

  def inspect
    "(#{@x},#{@y})"
  end
end