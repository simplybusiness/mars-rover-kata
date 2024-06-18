class Rover
  attr_reader :direction

  def initialize(x, y, direction = 'N')
    @coordinates = [x, y]
    @direction = direction
  end

  def initial_points
    @coordinates
  end
end
