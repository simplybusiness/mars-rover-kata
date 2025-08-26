class MarsRover
    def initialize(starting_position: [0, 0])
        @current_position = starting_position
    end

    attr_reader :current_position
end