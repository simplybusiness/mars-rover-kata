class MarsRover
    attr_reader :position

    def initialize(starting_point)
        if !starting_point[0].is_a?(Integer) || !starting_point[1].is_a?(Integer)
            raise ArgumentError
        end

        @position = starting_point
    end
end
