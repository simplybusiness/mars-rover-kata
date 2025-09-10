class MarsRover
    VALID_DIRECTIONS = ['N', 'E', 'S', 'W']

    def initialize(starting_position:, starting_direction:)
        if starting_position.nil? || !starting_position.is_a?(Coordinates)
          raise ArgumentError, "Starting position is invalid and must be valid coordinates"
        end
        if !VALID_DIRECTIONS.include?(starting_direction)
            raise ArgumentError, "Starting direction is invalid and must be N, E, S, or W"     
        end  
        @current_position = starting_position
        @current_direction = starting_direction 
    end

    attr_reader :current_position, :current_direction
end