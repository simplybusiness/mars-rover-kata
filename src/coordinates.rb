# frozen_string_literal: true

class Coordinates
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
    freeze
  end

  def change_x(increase: true)
    if increase
      Coordinates.new(x: @x + 1, y: @y)
    else
      Coordinates.new(x: @x - 1, y: @y)
    end
  end

  def change_y(increase: true)
    if increase
      Coordinates.new(x: @x, y: @y + 1)
    else
      Coordinates.new(x: @x, y: @y - 1)
    end
  end

  def ==(other)
    other.is_a?(self.class) && @x == other.x && @y == other.y
  end
end
