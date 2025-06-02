Point = Data.define(:x, :y)

class MarsRover
  attr_accessor :x, :y, :direction

  GRID_WIDTH = 10
  GRID_HEIGHT = 10

  DIRECTIONS = ['N', 'E', 'S', 'W'] # Ordered for a right turn

  MOVEMENT_VECTORS = {
    'N' => { x: 0, y: 1},
    'E' => { x: 1, y: 0},
    'S' => { x: 0, y: -1},
    'W' => {x: -1, y: 0},
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
    desired_x, desired_y = attempt_to_move_forward

    if desired_y > GRID_HEIGHT || desired_y < 0
      raise ArgumentError, "Rover will go out of bounds"
    end

    if desired_x > GRID_WIDTH || desired_x < 0
      raise ArgumentError, "Rover will go out of bounds"
    end

    self.x = desired_x
    self.y = desired_y

    @current_location = Point.new(x: @x, y: @y)

    return self
  end

  def attempt_to_move_forward()
    desired_x = @current_location.x
    desired_y = @current_location.y

    if self.direction == "E" || self.direction == "W"
      desired_x = @current_location.x + MarsRover::MOVEMENT_VECTORS[@direction][:x]  
    end
    if self.direction == "N" || self.direction == "S"
      desired_y = @current_location.y + MarsRover::MOVEMENT_VECTORS[@direction][:y]
    end
  
    [desired_x, desired_y]
  end

  def x
    @current_location.x
  end

  def y
    @current_location.y
  end

end
