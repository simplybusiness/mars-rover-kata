class MarsRover
  attr_accessor :x, :y, :direction, :coordinates

  def initialize(x: 0, y: 0, direction: 'N', coordinates: {x: x, y: y})
    @x = x
    @y = y
    @direction = direction
    @coordinates = coordinates
  end

  def execute(commands)
    direction_table = {
      'N' => [0, 1],
      'E' => [1, 0],
      'S' => [0, -1],
      'W' => [-1, 0]
    }

    displacement_table = {
      'N' => {x: 0, y: 1},
      'E' => {x: 1, y: 0},
      'W' => {x: 0, y: -1},
      'S' => {x: -1, y: 0}
    }

    if direction_table.key?(@direction)
      dx, dy = direction_table[@direction]
      @x += dx
      @y += dy
    end
  end
end
