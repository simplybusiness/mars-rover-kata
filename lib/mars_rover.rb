class MarsRover

  def initialize(x, y, direction)
    set_position(x, y)
    set_direction direction
  end

  def position
    return @x, @y
  end

  def direction
    @direction.name
  end

  def inspect
    "(#{@x},#{@y}, #{@direction.name})"
  end

  def forward
    @direction.forward
    @x = @direction.x
    @y = @direction.y
  end

  def backward
    @direction.backward
    @x = @direction.x
    @y = @direction.y
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

    @direction = Object.const_get('Direction' + direction).new(@x, @y)
  end
end