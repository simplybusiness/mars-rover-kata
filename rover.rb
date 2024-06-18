class Rover
  attr_reader :direction, :coordinates

  def initialize(x, y, direction = 'N')
    @coordinates = [x, y]
    @direction = direction
  end
end
