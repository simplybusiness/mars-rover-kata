require 'coordinates'

class MarsRover
  attr_reader :direction
  attr_reader :coordinates_new
  
  def initialize(direction, coordinates = [0, 0])
    directions = ['N', 'S', 'W', 'E']

    raise ArgumentError unless coordinates.is_a?(Array)
    raise ArgumentError unless coordinates[0].is_a?(Integer) && coordinates[1].is_a?(Integer)
    raise ArgumentError unless coordinates[0] >= 0 && coordinates[1] >= 0

    raise ArgumentError unless directions.include?(direction)

    @coordinates_new = Coordinates.new(x: coordinates[0], y: coordinates[1])
    @direction = direction
  end

  def execute(commands)
    commands.each do | command |
      case command
      when 'f'
        move_forwards
      when 'b'
        move_backwards
      end
    end
  end

  def inspect
    "a Mars rover at (#{coordinates_new.x}, #{coordinates_new.y}) facing #{direction}"
  end

  private

  def move_backwards
    backward_movement = {
      'N' => -1,
      'S' => 1,
      'W' => 1,
      'E' => -1,
    }
    case @direction
    when 'N'
      @coordinates_new.y += backward_movement[@direction]
    when 'S'
      @coordinates_new.y += backward_movement[@direction]
    when 'W'
      @coordinates_new.x += backward_movement[@direction]
    when 'E'
      @coordinates_new.x += backward_movement[@direction]
    end
  end

  def move_forwards
      forward_movement = {
        'N' => 1,
        'S' => -1,
        'E' => 1,
        'W' => -1
      }
      case @direction
      when 'N'
          @coordinates_new.y += forward_movement[@direction]
      when 'S'
          @coordinates_new.y += forward_movement[@direction]
      when 'E'
          @coordinates_new.x += forward_movement[@direction]
      when 'W'
          @coordinates_new.x += forward_movement[@direction]
      end
  end
end
