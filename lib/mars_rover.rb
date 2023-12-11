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
    vertical_movement = {
      'N' => 1,
      'S' => -1
    }
    horizontal_movement = {
      'E' => 1,
      'W' => -1
    }
    forward_movement = vertical_movement.merge(horizontal_movement)
    command.each do |com|
        @coordinates[1] += forward_movement[@direction] if com == "f" and vertical_movement.has_key?(@direction)
        @coordinates[0] += forward_movement[@direction] if com == "f" and horizontal_movement.has_key?(@direction)
    end 
  end

  def inspect
    "a Mars rover at (#{coordinates[0]}, #{coordinates[1]}) facing #{direction}"
  end

    
end
