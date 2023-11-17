require 'coordinate'
require 'pry'

class Rover
    attr_reader :position, :direction, :coordinate_position, :coordinates
    LEFT = 'l'
    RIGHT = 'r'
    FORWARD = 'f'
    BACKWARD = 'b'
    NORTH = 'N'
    WEST = 'W'
    EAST = 'E'
    SOUTH = 'S'

    def initialize (coordinates: Coordinate.new(0,0), direction: NORTH)
      @coordinate_position = coordinates
      @coordinates = coordinates
      @direction = direction
    end

    def inspect
      "Coordinates: #{coordinates.inspect} Direction: #{direction}"
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
      current_x = @coordinates.x
      current_y = @coordinates.y

      case @direction
      when SOUTH
        @coordinates = Coordinate.new(current_x, current_y - 1)
      when NORTH
        @coordinates = Coordinate.new(current_x, current_y + 1)
      when EAST
        @coordinates = Coordinate.new(current_x + 1, current_y)
      when WEST
        @coordinates = Coordinate.new(current_x - 1, current_y)
      end
    end

    def move_backward
      current_x = @coordinates.x
      current_y = @coordinates.y

      case @direction
      when SOUTH
        @coordinates = Coordinate.new(current_x, current_y + 1)
      when NORTH
        @coordinates = Coordinate.new(current_x, current_y - 1)
      when EAST
        @coordinates = Coordinate.new(current_x - 1 , current_y)
      when WEST
        @coordinates = Coordinate.new(current_x + 1 , current_y)
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
