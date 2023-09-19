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

    execute_commands
  end


  def execute_commands
    @commands.each do | command |
      if command == 'f'
        case @direction
        when 'S'
          @point.y -= 1
        else
          @point.y += 1
        end
      end
    end
  end
end
