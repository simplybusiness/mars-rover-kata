class MarsRover
    VALID_DIRECTIONS = ['N', 'E', 'S', 'W']

    attr_reader :current_position, :current_direction

    def initialize(starting_position:, starting_direction:)
        raise ArgumentError, "Starting position is invalid and must be valid coordinates" if !starting_position.is_a?(Coordinates)
        if !VALID_DIRECTIONS.include?(starting_direction)
            raise ArgumentError, "Starting direction is invalid and must be N, E, S, or W"     
        end  
        @current_position = starting_position
        @current_direction = starting_direction 
    end

    def execute(commands)
      total_displacement = [0, 0]
      commands.each do |command|
        total_displacement = if command == "f"
                               move_forwards(total_displacement: total_displacement)
                             else
                               move_backwards(total_displacement: total_displacement)
                             end
      end
      set_position(current_position.x + total_displacement[0], current_position.y + total_displacement[1])
    end

    def inspect
        "Mars rover located at #{current_position.inspect} facing #{current_direction}"
    end

    private

    def move_backwards(total_displacement:)
      total_displacement[1] -= 1
      total_displacement
    end

    def move_forwards(total_displacement:)
      total_displacement[1] += 1 if current_direction == "N"
      total_displacement[0] += 1 if current_direction == "E"
      total_displacement
    end

    def set_position(x, y)
        @current_position = Coordinates.new(x, y)
    end
end