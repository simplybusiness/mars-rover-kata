class MarsRover
    def initialize(starting_position:)
        @current_position = starting_position
    end

    attr_reader :current_position
end