# frozen_string_literal: true
require 'ostruct'

class MarsRover
  attr_reader :point, :direction

  def initialize(direction, point)
    @point = point
    @direction = direction
  end
end
