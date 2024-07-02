class Rover
  attr_reader :coordinates, :direction

  def initialize(x, y, direction = 'N')
    raise StandardError unless ['N', 'S', 'E', 'W'].include?direction

    @coordinates = [x, y]
    @direction = direction
  end
end
