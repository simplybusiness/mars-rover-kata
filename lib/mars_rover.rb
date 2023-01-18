class MarsRover
  attr_reader :direction
  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def coordinates
    [@x, @y]
  end
end
