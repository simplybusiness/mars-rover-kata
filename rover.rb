class Rover
  attr_reader :coordinates

  def initialize(x, y, direction = 'N')
    @coordinates = [x, y]
    @direction = direction
  end

  def direction
    raise StandardError unless @direction == 'N' || @direction == 'S' || @direction == 'E' || @direction == 'W'

    @direction
  end
end
