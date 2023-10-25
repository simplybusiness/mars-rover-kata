# frozen_string_literal: true

class BadCoordinatesError < ArgumentError; end

class Coordinates
  attr_reader :x, :y

  def initialize(x:, y:)
    raise BadCoordinatesError, 'Position should have Integer coordinates' unless x.is_a?(Integer) && y.is_a?(Integer)

    @x = x
    @y = y
  end

  def ==(other)
    self.class == other.class &&
      @x == other.x &&
      @y == other.y
  end

  def change_position(coordinates)
    return if self == coordinates

    @x = coordinates.x
    @y = coordinates.y
  end
end
