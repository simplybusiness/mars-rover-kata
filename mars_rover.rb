class MarsRover
    def initialize(starting_position:, starting_direction:)
        @current_position = starting_position
        @current_direction = starting_direction
    end

    def direction
        @current_direction
    end

    attr_reader :current_position
end