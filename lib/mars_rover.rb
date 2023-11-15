class MarsRover
    attr_reader :position
   
    def initialize(x, y)
        
        if !x.is_a?(Integer) || !y.is_a?(Integer)
            raise ArgumentError
        end

        if x < 0 || y < 0
            raise ArgumentError
        end 

        @position = [x, y]
    end

end
