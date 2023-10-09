class MarsRover
    attr_reader :position

    def initialize(starting_point)
        raise ArgumentError.new('Starting point should have [x, y] coordinate') unless starting_point.length == 2  
        raise ArgumentError.new('Starting point should have Integer coordinates') unless starting_point[0].is_a?(Integer) && starting_point[1].is_a?(Integer)

        @position = starting_point
    end
end
