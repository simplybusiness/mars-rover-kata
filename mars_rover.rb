class MarsRover
  attr_accessor :x, :y, :orientation

  def initialize(x,y,orientation)
    @x = x
    @y = y
    @orientation = "N"
  end

  def execute(commands)
    @y = @y + 1
  end
end

