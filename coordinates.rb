# frozen_string_literal: true

class Coordinates
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    freeze
  end

  def inspect
    "(#{@x}, #{@y})"
  end

  def ==(other)
    @x == other.x && @y == other.y
  end
end
