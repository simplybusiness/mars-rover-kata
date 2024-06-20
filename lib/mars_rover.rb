class MarsRover
  attr_reader :direction

  def initialize(x, y, direction)
    setPosition(x, y)
    setDirection direction
  end

  def position
    return @x, @y
  end

  def setPosition(x, y)
    unless x.is_a? Integer
      raise ArgumentError, 'Invalid x position, must be an integer'
    end

    unless y.is_a? Integer
      raise ArgumentError, 'Invalid y position, must be an integer'
    end

    @x = x
    @y = y
  end

  def setDirection(direction)
    unless ['north', 'south', 'east', 'west'].include? direction
      ## TODO change to argument error
      raise Exception.new, "Invalid direction: '#{direction}'"
    end

    @direction = direction
  end
end