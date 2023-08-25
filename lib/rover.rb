class Rover
    attr_reader :position, :direction
    NORTH = 'N'
    LEFT = 'l'
    RIGHT = 'r'
    WEST = 'W'
    EAST = 'E'
   
    def initialize (coordinates:[0,0], direction: NORTH)
        @position = coordinates
        @direction = direction
    end

    def move (route)
      if route.length > 0
        case route
        when LEFT 
          @direction = WEST
        when RIGHT
          @direction = EAST
        else
          raise ArgumentError
        end
      end
    end
end