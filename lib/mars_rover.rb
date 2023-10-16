# frozen_string_literal: true
require 'ostruct'
require_relative 'point'

class MarsRover
  attr_reader :point

  def initialize(point)
    @point = point
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
    case point.direction
    when 'E'
      @point = @point.new_move_x(1)
    when 'S'
      @point = @point.new_move_y(-1)
    when 'W'
      @point = @point.new_move_x(-1)
    when 'N'
      @point = @point.new_move_y(1)
    end
  end

  def move_backward
    if point.direction ==  'N'
      @point = @point.new_move_y(-1)
    elsif point.direction == 'S'
      @point = @point.new_move_y(1)
    end
  end
end
