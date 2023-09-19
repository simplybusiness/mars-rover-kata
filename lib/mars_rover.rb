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
        move_forward
      end
    end
  end

  private

  def move_forward
    case @direction
    when 'S'
      @point = OpenStruct.new(x: @point.x, y: @point.y - 1)
    else
      @point = OpenStruct.new(x: @point.x, y: @point.y + 1)
    end
  end
end
