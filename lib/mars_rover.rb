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
      when 'l'
        move_left
      when 'r'
        move_right
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
    case point.direction
    when 'E'
      @point = @point.new_move_x(-1)
    when 'S'
      @point = @point.new_move_y(1)
    when 'W'
      @point = @point.new_move_x(1)
    when 'N'
      @point = @point.new_move_y(-1)
    end
  end

  def move_left
    case point.direction
    when 'E'
      @point = Point.new(@point.x, @point.y, 'N')
    when 'S'
      @point = Point.new(@point.x, @point.y, 'E')
    when 'W'
      @point = Point.new(@point.x, @point.y, 'S')
    when 'N'
      @point = Point.new(@point.x, @point.y, 'W')
    end
  end


  def move_right
    case point.direction
    when 'E'
      @point = @point.new_move_y(-1)
    when 'S'
      @point = @point.new_move_x(-1)
    when 'W'
      @point = @point.new_move_y(1)
    when 'N'
      @point = @point.new_move_x(1)
    end
  end
end



