class MarsRover
  attr_accessor :x, :y, :direction, :coordinates

  def initialize(x: 0, y: 0, direction: 'N', coordinates: {x: x, y: y})
    @x = x
    @y = y
    @direction = direction
    @coordinates = coordinates
  end

  def execute(commands)
    displacement_table = {
      'N' => {x: 0, y: 1},
      'E' => {x: 1, y: 0},
      'S' => {x: 0, y: -1},
      'W' => {x: -1, y: 0}
    }

    if displacement_table.key?(@direction)
      dx, dy = displacement_table[@direction].values
      @x += dx
      @y += dy
    end
  end
end
