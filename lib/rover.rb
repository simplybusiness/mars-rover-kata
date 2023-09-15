class Rover
    attr_reader :position, :direction
    LEFT = 'l'
    RIGHT = 'r'
    FORWARD = 'f'
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

    def turn_left
      case @direction
      when SOUTH
        @direction = EAST
      when WEST
        @direction = SOUTH
      when EAST
        @direction = NORTH
      when NORTH
        @direction = WEST
      end
    end

    def move (route)
      if route.any?
        route.each do |direction|
          case direction
          when LEFT 
            turn_left
          when RIGHT
            turn_right
          when FORWARD
            @position = [4,4]
          else
            raise ArgumentError
          end
        end
      end
    end
end