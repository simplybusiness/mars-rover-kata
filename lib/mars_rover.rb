# frozen_string_literal: true
require 'ostruct'

class MarsRover
  attr_reader :direction

  def initialize(x, y, direction, point = OpenStruct.new(x: x, y: y))
    @x = x
    @y = y
    @point = point
    @direction = direction
  end

  def point
    @point
  end
end
