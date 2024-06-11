class Rover
  def initialize(x, y)
    @x = x
    @y = y
    @coordinates = [x, y]
  end

  def initial_points
    @coordinates
  end
end
