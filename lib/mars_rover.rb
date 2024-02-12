class MarsRover
  attr_accessor :x, :y, :direction

  def initialize(x: 0, y: 0, direction: 'N')
    @x = x
    @y = y
    @direction = direction
  end

  def execute(commands)
  end
end