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
        if commands[0] == "f"
            set_position(current_position.x, current_position.y + 1)  
        else
            set_position(current_position.x, current_position.y - 1)  
        end
    end

    def inspect
        "Mars rover located at #{current_position.inspect} facing #{current_direction}"
    end

    private 
    def set_position(x, y)
        @current_position = Coordinates.new(x, y)
    end
end