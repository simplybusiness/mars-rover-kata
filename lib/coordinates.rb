class BadCoordinatesError < ArgumentError; end
class Coordinates

  attr_accessor :x
  attr_accessor :y

  def initialize(x:, y:)
      raise BadCoordinatesError.new('Position should have Integer coordinates') unless x.is_a?(Integer) && y.is_a?(Integer)
    @x = x
    @y = y
  end

  def ==(other)
    self.class == other.class &&
      @x == other.x &&
      @y == other.y
  end
end
