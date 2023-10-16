# frozen_string_literal: true

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def coordinates
    '[%d %d]' % [@x, @y]
  end

  def move_x(value)
    @x += value if value.is_a?(Integer)
  end

  def move_y(value)
    @y += value if value.is_a?(Integer)
  end
end
