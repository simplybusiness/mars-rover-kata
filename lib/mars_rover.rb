# frozen_string_literal: true
require 'ostruct'

class MarsRover
  attr_reader :point, :direction, :commands

  def initialize(direction, point)
    @point = point
    @direction = direction
  end

  def add_commands(commands)
    @commands = commands
  end
end
