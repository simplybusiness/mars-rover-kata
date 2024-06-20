class MarsRover
  attr_reader :direction

  def initialize(x, y, direction)
    set_position(x, y)
    set_direction direction
  end

  def position
    return @x, @y
  end

  def inspect
    "(#{@x},#{@y}, #{@direction})"
  end

  def forward
    @y = @y + 1
  end

  private

  def set_position(x, y)
    unless x.is_a?(Integer) && y.is_a?(Integer)
      raise ArgumentError, 'Invalid x or y position, both must be an integer'
    end

    @x = x
    @y = y
  end

  def set_direction(direction)
    unless ['N', 'S', 'E', 'W'].include? direction
      ## TODO change to argument error
      raise ArgumentError, "Invalid direction: '#{direction}', 'N, S, E, W' accepted"
    end

    @direction = direction
  end
end