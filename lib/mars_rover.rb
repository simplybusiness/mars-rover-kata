# frozen_string_literal: true
require 'ostruct'
require_relative 'point'

class MarsRover
  attr_reader :point, :direction, :new_point

  def initialize(direction, point, new_point: nil)
    @point = point
    @new_point = new_point
    @direction = direction
  end

  def execute_commands(commands)
    return unless commands.is_a?(Array) && commands.length > 0

    commands.each do |command|
      case command
      when 'f'
        move_forward
      when 'b'
        move_backward
      end
    end
  end

  private

  def move_forward
    case @direction
    when 'E'
      @point = OpenStruct.new(x: @point.x + 1, y: @point.y)
    when 'S'
      @point = OpenStruct.new(x: @point.x, y: @point.y - 1)
    when 'W'
      @point = OpenStruct.new(x: @point.x - 1, y: @point.y)
    when 'N'
      @point = OpenStruct.new(x: @point.x, y: @point.y + 1)
    end
  end

  def move_backward
    if @direction ==  'N'
      @point = OpenStruct.new(x: @point.x, y: @point.y - 1 )
    elsif @direction == 'S'
      @point = OpenStruct.new(x: @point.x, y: @point.y + 1 )
    end
  end
end
