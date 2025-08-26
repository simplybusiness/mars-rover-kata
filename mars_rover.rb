class MarsRover
    def initialize(starting_position:, current_direction: "N")
        @current_position = starting_position
        @current_direction = current_direction
    end

    def direction
        @current_direction
    end

    attr_reader :current_position
end