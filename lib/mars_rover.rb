# frozen_string_literal: true
require 'ostruct'

class MarsRover
  attr_reader :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def point
    OpenStruct.new(x: @x, y: @y)
  end
end
