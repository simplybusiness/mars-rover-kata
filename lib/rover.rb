require_relative "coordinate"

class Rover
  attr_reader :direction, :coordinate_position
  LEFT = "l"
  RIGHT = "r"
  FORWARD = "f"
  BACKWARD = "b"
  NORTH = "N"
  WEST = "W"
  EAST = "E"
  SOUTH = "S"

  def initialize(coordinates: Coordinate.new(x = 0, y = 0, x_pos: 0, y_pos: 0), direction: NORTH)
    @coordinate_position = coordinates
    @direction = direction
  end

  def move(route)
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
    current_x = @coordinate_position.x
    current_y = @coordinate_position.y

    case @direction
    when SOUTH
      @coordinate_position.y = current_y - 1
    when NORTH
      @coordinate_position.y = current_y + 1
    when EAST
      @coordinate_position.x = current_x + 1
    when WEST
      @coordinate_position.x = current_x - 1
    end
  end

  def move_backward
    current_x = @coordinate_position.x
    current_y = @coordinate_position.y

    case @direction
    when SOUTH
      @coordinate_position.y = current_y + 1
    when NORTH
      @coordinate_position.y = current_y - 1
    when EAST
      @coordinate_position.x = current_x - 1
    when WEST
      @coordinate_position.x = current_x + 1
    end
  end
end
