# frozen_string_literal: true

class Point
  attr_reader :x, :y, :direction

  def initialize(x, y, direction = 'N')
    @x = x
    @y = y
    @direction = direction
  end

  def coordinates
    '[%d %d]' % [@x, @y]
  end

  def coordinates_with_direction
    '[%d %d %s]' % [@x, @y, @direction]
  end

  def move_x(value)
    @x += value if value.is_a?(Integer)
  end

  def move_y(value)
    @y += value if value.is_a?(Integer)
  end
end
