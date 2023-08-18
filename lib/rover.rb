class Rover
    attr_reader :position, :direction
    NORTH = 'N'
    LEFT = 'l'
    WEST = 'W'
   
    def initialize (coordinates:[0,0], direction: NORTH)
        @position = coordinates
        @direction = direction
    end

    def move (route)
      if route.length > 0
        if route == LEFT
          @direction = WEST
        else
          raise ArgumentError
        end
      end
    end
end