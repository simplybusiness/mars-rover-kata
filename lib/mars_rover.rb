class MarsRover
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def coordinates
    [@x, @y]
  end

  def orientation
    "N"
  end
end
