class BadCoordinatesError < ArgumentError; end
class Coordinates

  attr_reader :x
  attr_reader :y

  def initialize(x:, y:)
      raise BadCoordinatesError.new('Starting point should have Integer coordinates') unless x.is_a?(Integer) && y.is_a?(Integer)

    @x = x
    @y = y
  end
end
