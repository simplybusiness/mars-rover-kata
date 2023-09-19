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

  private

  def execute_commands
    @commands.each do | command |
      if command == 'f'
        move_forward
      end
    end
  end



  def move_forward
    case @direction
    when 'E'
      @point = OpenStruct.new(x: @point.x + 1, y: @point.y)
    when 'S'
      @point = OpenStruct.new(x: @point.x, y: @point.y - 1)
    when 'W'
      @point = OpenStruct.new(x: @point.x - 1, y: @point.y)
    else
      @point = OpenStruct.new(x: @point.x, y: @point.y + 1)
    end
  end
end
