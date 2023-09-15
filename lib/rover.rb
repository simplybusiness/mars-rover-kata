class Rover
    attr_reader :position, :direction
    LEFT = 'l'
    RIGHT = 'r'
    NORTH = 'N'
    WEST = 'W'
    EAST = 'E'
    SOUTH = 'S'
   
    def initialize (coordinates:[0,0], direction: NORTH)
        @position = coordinates
        @direction = direction
    end

    def turn_right
      case @direction
      when SOUTH
        @direction = WEST
      when WEST
        @direction = NORTH
      when EAST
        @direction = SOUTH
      when NORTH
        @direction = EAST
      end
    end

    def move (route)
      if route.length > 0
        case route
        when LEFT 
          @direction = WEST
        when RIGHT
          turn_right
        else
          raise ArgumentError
        end
      end
    end
end