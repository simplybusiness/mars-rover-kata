require 'coordinates'

class MarsRover
  attr_reader :direction
  attr_reader :coordinates
  
  def initialize(direction, coordinates = [0, 0])
    directions = ['N', 'S', 'W', 'E']

    raise ArgumentError unless coordinates.is_a?(Array)
    raise ArgumentError unless coordinates[0].is_a?(Integer) && coordinates[1].is_a?(Integer)
    raise ArgumentError unless coordinates[0] >= 0 && coordinates[1] >= 0

    raise ArgumentError unless directions.include?(direction)

    @coordinates = Coordinates.new(x: coordinates[0], y: coordinates[1])
    @direction = direction
  end

  def execute(commands)
    commands.each do | command |
      case command
      when 'f'
        move(1)
      when 'b'
        move(-1)
      when 'l'
        turn_leftwards
      when 'r'
        turn_rightwards
      end
    end
  end

  def inspect
    "a Mars rover at (#{coordinates.x}, #{coordinates.y}) facing #{direction}"
  end

  private

  def move(step)
    case @direction
    when 'N'
      @coordinates.y += step
    when 'S'
      @coordinates.y -= step
    when 'E'
      @coordinates.x += step
    when 'W'
      @coordinates.x -= step
    end
  end

  def move_backwards
    case @direction
    when 'N'
      @coordinates.y += -1
    when 'S'
      @coordinates.y += 1
    when 'E'
      @coordinates.x += -1
    when 'W'
      @coordinates.x += 1
    end
  end

  def move_forwards
      case @direction
      when 'N'
          @coordinates.y += 1
      when 'S'
          @coordinates.y += -1
      when 'E'
          @coordinates.x += 1
      when 'W'
          @coordinates.x += -1
      end
  end

  def turn_leftwards
    case @direction
    when 'N'
      @direction = 'W'
    when 'S'
      @direction = 'E'
    when 'E'
      @direction = 'N'
    when 'W'
      @direction = 'S'
    end
  end

  def turn_rightwards
    case @direction
    when 'N'
      @direction = 'E'
    when 'S'
      @direction = 'W'
    when 'W'
      @direction = 'N'
    when 'E'
      @direction = 'S'
    end
  end
end
