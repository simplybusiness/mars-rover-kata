class MarsRover
    attr_reader :position
    attr_reader :direction
    attr_reader :coordinates
   
    def initialize(x, y, direction, coordinates = [0, 0])
        directions = ["N", "S", "W", "E"]

        raise ArgumentError unless x.is_a?(Integer) && y.is_a?(Integer)
        raise ArgumentError unless x >= 0 && y >= 0

        raise ArgumentError unless coordinates.is_a?(Array)
        raise ArgumentError unless coordinates[0].is_a?(Integer) && coordinates[1].is_a?(Integer)
        raise ArgumentError unless coordinates[0] >= 0 && coordinates[1] >= 0

        raise ArgumentError unless directions.include?(direction)

        @position = [x, y]
        @coordinates = coordinates
        @direction = direction
    end
    
end
