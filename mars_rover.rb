Point = Data.define(:x, :y) do
  def move(displacement)
    Point.new(x: self.x + displacement[:x], y: self.y + displacement[:y])
  end
end

class MarsRover
  attr_accessor :direction
  attr_reader :current_location

  GRID_WIDTH = 10
  GRID_HEIGHT = 10

  DIRECTIONS = ['N', 'E', 'S', 'W'] # Ordered for a right turn

  FORWARD_MOVEMENT_VECTORS = {
    'N' => { x: 0, y: 1},
    'E' => { x: 1, y: 0},
    'S' => { x: 0, y: -1},
    'W' => {x: -1, y: 0},
  }
  BACKWARDS_MOVEMENT_VECTORS = {
    'N' => { x: 0, y: -1},
    'E' => { x: -1, y: 0},
    'S' => { x: 0, y: 1},
    'W' => {x: 1, y: 0},
  }

  def initialize(start_x, start_y, start_direction)
    @grid_width = GRID_WIDTH
    @grid_height = GRID_HEIGHT

    # "Rover out of bounds, got {x: __, y: __}"

    unless start_x.between?(0, GRID_WIDTH)
      # raise ArgumentError, "x-coordinate is outside the grid"
      raise ArgumentError, "Rover out of bounds, got {x: #{start_x}, y: #{start_y}}"
    end

    unless start_y.between?(0, GRID_HEIGHT)
      raise ArgumentError, "Rover out of bounds, got {x: #{start_x}, y: #{start_y}}"
    end

    unless DIRECTIONS.include?(start_direction)
      raise ArgumentError, "Direction is invalid"
    end

    @direction = start_direction
    @current_location = Point.new(x: start_x, y: start_y)

  end

  def execute(command)
    if command == "f"
      displacement = MarsRover::FORWARD_MOVEMENT_VECTORS[@direction]
    elsif command == "b"
      displacement = MarsRover::BACKWARDS_MOVEMENT_VECTORS[@direction]
    end

    @current_location = @current_location.move(displacement)

    unless @current_location.y.between?(0,  GRID_HEIGHT)
      raise ArgumentError, "Rover will go out of bounds"
    end

    unless @current_location.x.between?(0, GRID_WIDTH)
      raise ArgumentError, "Rover will go out of bounds"
    end

    return self
  end

  def x
    @current_location.x
  end

  def y
    @current_location.y
  end

end
