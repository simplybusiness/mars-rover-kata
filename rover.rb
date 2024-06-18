class Rover
  def initialize(x, y)
    @coordinates = [x, y]
    @direction = 'N'
  end

  def initial_points
    @coordinates
  end

  def direction
    @direction
  end
end
