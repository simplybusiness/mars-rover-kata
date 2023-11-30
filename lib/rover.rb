require 'coordinate'
require 'planet'
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

    def initialize (coordinates: Coordinate.new(0,0), direction: NORTH, planet: Planet.new(10, 10))
      @coordinates = coordinates
      @direction = direction
      @planet = planet
    end

    def inspect
      "Rover located at #{coordinates.inspect} facing #{direction}"
    end

    def turn_right
      @direction = {SOUTH => WEST, WEST => NORTH, EAST => SOUTH, NORTH => EAST}[@direction]
    end

    def turn_left
      @direction = {SOUTH => EAST, WEST => SOUTH, EAST => NORTH, NORTH => WEST}[@direction]
    end

    def move_forward
      x_position = @coordinates.x
      y_position = @coordinates.y


      case @direction
      when SOUTH
        y_position = y_position == @planet.south_edge ? @planet.north_edge : y_position - 1
      when NORTH
        y_position = y_position==@planet.north_edge ? @planet.south_edge : y_position + 1
      when EAST
        x_position = x_position == @planet.east_edge ? @planet.west_edge : x_position + 1
      when WEST
        x_position = x_position == @planet.west_edge ? @planet.east_edge : x_position - 1
      end

      @coordinates = Coordinate.new(x_position, y_position)
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
