require_relative 'position'

# Description: This class represents a rover that can move in directional manner on a x,y grid
class Rover
  attr_reader :direction

  def initialize(position, direction)
    @direction = direction

    raise 'Invalid position, must be an array of [X, Y]' unless valid_position?(position)
    raise 'Invalid direction, must be one of N,S,W,E' unless valid_direction?

    @position = Position.new(x: position[0], y: position[1])

    @position_x = @position.x
    @position_y = @position.y
  end

  def position
    [@position_x, @position_y]
  end

  def command(commands)
    raise Exception.new('Invalid command, must be an array of characters') unless commands.is_a? Array

    if commands[0] == 'f'
      move_forward
    end
  end

  private

  def move_forward
    case @direction
      when 'N'
        move_y(1)
      when 'S'
        move_y(-1)
      when 'E'
        move_x(1)
    end
  end

  def move_y(value)
    @position.y += value
    @position_y += value
  end

  def move_x(value)
    @position_x += value
  end

  def valid_position?(position)
    return false unless position.is_a? Array
    return false unless position[0].is_a? Integer
    return false unless position[1].is_a? Integer
    true
  end

  def valid_direction?
    %w(N S W E).include? @direction
  end
end
