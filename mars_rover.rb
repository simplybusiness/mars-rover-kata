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

  end

  def execute(command)
    self.y = self.y + 1
    return self
  end

  # def y
  #   :y
  # end
end



