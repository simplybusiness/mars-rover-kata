class MarsRover
    attr_reader :position 
    attr_reader :direction 

    def initialize(starting_point, direction)
        raise ArgumentError.new('Starting point should have [x, y] coordinate') unless starting_point.length == 2  
        raise ArgumentError.new('Starting point should have Integer coordinates') unless starting_point[0].is_a?(Integer) && starting_point[1].is_a?(Integer)
        raise ArgumentError.new('Direction is not valid, use one of (N,S,E,W)') unless ['N','E','S','W'].include?(direction)

        @position = starting_point
        @direction = direction
    end
end
