# frozen_string_literal: true
require 'ostruct'

class MarsRover
  attr_reader :direction

  def initialize(direction, point)
    @point = point
    @direction = direction
  end

  def point
    @point
  end
end
