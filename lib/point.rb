# frozen_string_literal: true

class Point
  attr_reader :x, :y, :direction

  def initialize(x, y, direction = 'N')
    @x = x
    @y = y
    @direction = direction
  end

  def coordinates
    '[%d %d %s]' % [@x, @y, @direction]
  end

  def move_x(value)
    @x += value if value.is_a?(Integer)
  end

  def new_move_x(value)
    return unless value.is_a?(Integer)

    Point.new(@x+value, @y, @direction)
  end

  def new_move_y(value)
    return unless value.is_a?(Integer)

    Point.new(@x, @y+value, @direction)
  end

  def move_y(value)
    @y += value if value.is_a?(Integer)
  end
end
