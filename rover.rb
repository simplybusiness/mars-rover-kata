class Rover
  def initialize(x, y, direction = 'N')
    @coordinates = [x, y]
    @direction = direction
  end

  def initial_points
    @coordinates
  end

  def direction
    @direction
  end
end
