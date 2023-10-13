# frozen_string_literal: true

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def coordinates
    [@x, @y]
  end

  def move_x(value)
    @x += value if value.is_a?(Integer)
  end
end
