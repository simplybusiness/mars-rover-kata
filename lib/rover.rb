require 'coordinate'
require 'pry'

# Rover class controls position and movement of the Mars Rover
class Rover

    attr_reader :position, :direction, :coordinates

    LEFT = 'l'
    RIGHT = 'r'
    FORWARD = 'f'
    BACKWARD = 'b'
    NORTH = 'N'
    WEST = 'W'
    EAST = 'E'
    SOUTH = 'S'

    def initialize (coordinates: Coordinate.new(0,0), direction: NORTH, planet_width: 10, planet_height: 10)
      @coordinates = coordinates
      @direction = direction
      @east_edge = planet_width / 2
      @west_edge = (planet_width / 2) * -1
      @north_edge = planet_height / 2
      @south_edge = (planet_height / 2) * -1
    end

    def inspect
      "Rover located at #{coordinates.inspect} facing #{direction}"
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
        new_y = current_y==@south_edge ? @north_edge : current_y - 1
        @coordinates = Coordinate.new(current_x, new_y)
      when NORTH
        new_y = current_y==@north_edge ? @south_edge : current_y + 1
        @coordinates = Coordinate.new(current_x, new_y)
      when EAST
        new_x = current_x == @east_edge ? @west_edge : current_x + 1
        @coordinates = Coordinate.new(new_x, current_y)
      when WEST
        new_x = current_x == @west_edge ? @east_edge : current_x - 1
        @coordinates = Coordinate.new(new_x, current_y)
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
