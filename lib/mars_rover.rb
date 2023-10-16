# frozen_string_literal: true
require 'ostruct'
require_relative 'point'

class MarsRover
  attr_reader :new_point

  def initialize( new_point)
    @new_point = new_point
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
    case new_point.direction
    when 'E'
      @new_point.move_x(1)
    when 'S'
      @new_point.move_y(-1)
    when 'W'
      @new_point.move_x(-1)
    when 'N'
      @new_point.move_y(1)
    end
  end

  def move_backward
    if new_point.direction ==  'N'
      @new_point.move_y(-1)
    elsif new_point.direction == 'S'
      @new_point.move_y(1)
    end
  end
end
