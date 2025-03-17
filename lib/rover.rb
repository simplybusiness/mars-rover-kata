require_relative 'position'

# Description: This class represents a rover that can move in directional manner on a x,y grid
class Rover
  attr_reader :direction

  def initialize(position, direction)
    @direction = direction

    begin
      @position = Position.new(x: position[0], y: position[1])
    rescue
      raise 'Invalid position, must be an array of [X, Y]'
    end

    raise 'Invalid direction, must be one of N,S,W,E' unless valid_direction?
  end

  def position
    [@position.x, @position.y]
  end

  def command(commands)
    raise Exception.new('Invalid command, must be an array of characters') unless commands.is_a? Array

    if commands[0] == 'f'
      move_forward
    end

    if commands[0] == 'b'
      move_backwards
    end
  end

  private

  def move_forward
    case @direction
      when 'N'
        @position.y += 1
      when 'S'
        @position.y -= 1
      when 'E'
        @position.x += 1
      when 'W'
        @position.x -= 1
    end
  end

  def move_backwards
    case @direction
      when 'N'
        @position.y -= 1
      when 'S'
        @position.y += 1
      when 'E'
        @position.x -= 1
    end
  end

  def valid_direction?
    %w(N S W E).include? @direction
  end
end
