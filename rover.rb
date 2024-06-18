class Rover
  attr_reader :coordinates

  def initialize(x, y, direction = 'N')
    @coordinates = [x, y]
    @direction = direction
  end

  def direction
    raise StandardError unless ['N', 'S', 'E', 'W'].include?@direction

    @direction
  end
end
