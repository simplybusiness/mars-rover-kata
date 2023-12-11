class MarsRover
  attr_reader :direction
  attr_reader :coordinates
  
  def initialize(direction, coordinates = [0, 0])
    directions = ['N', 'S', 'W', 'E']

    raise ArgumentError unless coordinates.is_a?(Array)
    raise ArgumentError unless coordinates[0].is_a?(Integer) && coordinates[1].is_a?(Integer)
    raise ArgumentError unless coordinates[0] >= 0 && coordinates[1] >= 0

    raise ArgumentError unless directions.include?(direction)

    @coordinates = coordinates
    @direction = direction
  end

  def execute(command)
    command.each do |com|
        move_forwards
    end
  end

  def inspect
    "a Mars rover at (#{coordinates[0]}, #{coordinates[1]}) facing #{direction}"
  end

  private

  def move_forwards
      vertical_movement = {
        'N' => 1,
        'S' => -1
      }
      horizontal_movement = {
        'E' => 1,
        'W' => -1
      }
      forward_movement = vertical_movement.merge(horizontal_movement)
      case @direction
      when 'N'
          @coordinates[1] += forward_movement[@direction]
      when 'S'
          @coordinates[1] += forward_movement[@direction]
      when 'E'
          @coordinates[0] += forward_movement[@direction]
      when 'W'
          @coordinates[0] += forward_movement[@direction]
      end
  end

end
