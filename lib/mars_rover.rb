class MarsRover
    attr_reader :position
    attr_reader :direction
   
    def initialize(x, y, direction, coordinates = [0, 0])
        directions = ["N", "S", "W", "E"]

        raise ArgumentError unless x.is_a?(Integer) && y.is_a?(Integer)
        raise ArgumentError unless x >= 0 && y >= 0
        raise ArgumentError unless directions.include?(direction)

        @position = [x, y]
        @direction = direction
    end
    
end
