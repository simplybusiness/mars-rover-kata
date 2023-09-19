# frozen_string_literal: true
require 'ostruct'

class MarsRover
  attr_reader :point, :direction, :commands

  def initialize(direction, point)
    @point = point
    @direction = direction
    @commands = []
  end

  def add_commands(commands)
    return unless commands.is_a?(Array) && commands.length > 0

    @commands = commands
  end


  def execute_commands
    # while rover is on
    #   while commands is not empty
    #       execute_command

  end
end
