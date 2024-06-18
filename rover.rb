class Rover
  def initialize(x, y)
    @coordinates = [x, y]
  end

  def initial_points
    @coordinates
  end

  def direction
    'N'
  end
end
