class Rover 
  attr_reader :x, :y, :direction

  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def move(command)
    @y = @y + 1
  end
end
