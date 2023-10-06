require 'coordinate'

class Rover
    attr_reader :position, :direction, :coordinate_position
    LEFT = 'l'
    RIGHT = 'r'
    FORWARD = 'f'
    BACKWARD = 'b'
    NORTH = 'N'
    WEST = 'W'
    EAST = 'E'
    SOUTH = 'S'
   
    def initialize (coordinates:[0,0], direction: NORTH)
        @position = coordinates
        @direction = direction
        @coordinate_position = Coordinate.new(x: @position[0], y: @position[1])
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

    def move_forward
      # determine which element of position gets changed
      current_x = @position[0]
      current_y = @position[1]
      
      case @direction
      when SOUTH
        @position[1] = current_y - 1
      when NORTH
        @position[1] = current_y + 1
      when EAST
        @position[0] = current_x + 1
        puts "current_position: #{@position[0]}"
      when WEST
        @position[0] = current_x - 1
      end
    end

    def move_backward
      current_x = @position[0]
      current_y = @position[1]

      case @direction
      when SOUTH
        @position[1] = current_y + 1
      when NORTH
        @position[1] = current_y - 1
      when EAST
        @position[0] = current_x - 1
      when WEST
        @position[0] = current_x + 1
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
            move_forward
          when BACKWARD
            move_backward
          else
            raise ArgumentError
          end
        end
      end
    end
end