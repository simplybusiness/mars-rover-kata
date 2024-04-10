class MarsRover
  attr_accessor :x, :y, :direction

  def initialize(x: 0, y: 0, direction: 'N', coordinates: {x: 0, y: 0})
    @x = x
    @y = y
    @direction = direction
  
  end

  def execute(commands)
    direction_table = {
      'N' => [0, 1],
      'E' => [1, 0],
      'S' => [0, -1],
      'W' => [-1, 0]
    }

    if direction_table.key?(@direction)
      dx, dy = direction_table[@direction]
      @x += dx
      @y += dy
    end
  end
end
