class MarsRover
  attr_reader :direction
  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def position
    return @x, @y
  end

  def setDirection(direction)
    if not ['north', 'south', 'east', 'west'].include? direction
      raise Exception.new, "Invalid direction: '#{direction}'"
    end
    @direction = direction
  end
end