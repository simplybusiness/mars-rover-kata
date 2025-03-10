# Description: This class represents a rover that can move in directional manner on a x,y grid
class Rover
  attr_reader :direction

  def initialize(position, direction)
    @direction = direction

    raise 'Invalid position, must be an array of [X, Y]' unless valid_position?(position)
    raise 'Invalid direction, must be one of N,S,W,E' unless valid_direction?(direction)
    @x = position[0]
    @y = position[1]
  end

  def command(commands)
    raise Exception.new('Invalid command, must be an array of characters') unless commands.is_a? Array

    if commands[0] == 'f'
      move_forward
    end
  end

  def position
    [@x, @y]
  end

  private

  def move_forward
    case @direction
      when 'N'
        move_y(1)
      when 'S'
        move_y(-1)
    end
  end

  def move_y(value)
    @y += value
  end

  def valid_position?(position = nil)
    return false unless position
    return false unless position.length == 2

    # TODO: For now assume that a valid position is an array of two integers
    position.all? { |value| value.is_a? Integer }
  end

  def valid_direction?(direction)
    %w(N S W E).include? direction
  end
end
