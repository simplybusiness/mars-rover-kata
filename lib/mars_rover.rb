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
    "A MarsRover located at: (#{@x},#{@y}), facing #{@direction.name}"
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

  def left
    @direction = Direction.load_direction(@direction.left, @x, @y)
  end

  def right
    @direction = Direction.load_direction(@direction.right, @x, @y)
  end

  def execute(instruction)
    case instruction
      when 'f' then forward
      when 'b' then backward
    end
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

    @direction = Direction.load_direction(direction, @x, @y)
  end

end