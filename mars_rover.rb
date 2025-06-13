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

  MOVEMENT_VECTORS = {
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

    unless start_x.between?(0, GRID_WIDTH)
      raise ArgumentError, "x-coordinate is outside the grid"
    end

    unless start_y.between?(0, GRID_HEIGHT)
      raise ArgumentError, "y-coordinate is outside the grid"
    end

    unless DIRECTIONS.include?(start_direction)
      raise ArgumentError, "Direction is invalid"
    end

    @x = start_x
    @y = start_y
    @direction = start_direction
    @current_location = Point.new(x: start_x, y: start_y)

  end

  def execute(command)
    if command == "f"
      displacement = MarsRover::MOVEMENT_VECTORS[@direction]
    elsif command == "b"
      displacement = MarsRover::BACKWARDS_MOVEMENT_VECTORS[@direction]
    end
    
    desired_x, desired_y = attempt_to_move_forward(displacement) if command == "f"
    desired_x, desired_y = attempt_to_move_backward(displacement) if command == "b"

    if desired_y > GRID_HEIGHT || desired_y < 0
      raise ArgumentError, "Rover will go out of bounds"
    end

    if desired_x > GRID_WIDTH || desired_x < 0
      raise ArgumentError, "Rover will go out of bounds"
    end

    @current_location = Point.new(x: desired_x, y: desired_y)

    return self
  end

  def attempt_to_move_forward(displacement)
    current_point = Point.new(@current_location.x, @current_location.y)

    new_point = current_point.move(displacement)
  
    [new_point.x, new_point.y]
  end

  def attempt_to_move_backward(displacement)
    # displacement = MarsRover::BACKWARDS_MOVEMENT_VECTORS[@direction]
    current_point = Point.new(@current_location.x, @current_location.y)

    new_point = current_point.move(displacement)
  
    [new_point.x, new_point.y]
  end

  def x
    @current_location.x
  end

  def y
    @current_location.y
  end

end
