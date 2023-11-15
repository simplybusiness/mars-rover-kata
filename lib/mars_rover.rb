class MarsRover
    attr_reader :position
    attr_reader :direction
   
    def initialize(x, y, direction)
        directions = ["N", "S", "W", "E"]

        if !x.is_a?(Integer) || !y.is_a?(Integer)
            raise ArgumentError
        end

        if x < 0 || y < 0
            raise ArgumentError
        end 

        if !directions.include?(direction) 
            raise ArgumentError
        end

        @position = [x, y]
        @direction = direction
    end
    
end
