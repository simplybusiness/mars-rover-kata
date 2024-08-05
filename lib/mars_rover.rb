class MarsRover

  def initialize(x, y, direction)
    self.position = [x, y]
    self.direction = direction
  end

  def position
    # move to a co oridinate object
    return @x, @y
  end

  def direction
    @direction.name
  end

  def inspect
    "A MarsRover located at: (#{@x},#{@y}), facing #{@direction.name}"
  end

  def execute(instruction)
    single_instruction = instruction.split

    single_instruction.each do |i|
      case i
        when 'f' then forward
        when 'b' then backward
        when 'l' then left
        when 'r' then right
      end
    end
  end

  private

  def left
    @direction = Direction.load_direction(@direction.left, @x, @y)
  end

  def right
    @direction = Direction.load_direction(@direction.right, @x, @y)
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

  def position=(position)
    x = position[0]
    y = position[1]

    unless x.is_a?(Integer) && y.is_a?(Integer)
      raise ArgumentError, 'Invalid x or y position, both must be an integer'
    end

    @x = x
    @y = y
  end

  def direction=(direction)
    unless ['N', 'S', 'E', 'W'].include? direction
      ## TODO change to argument error
      raise ArgumentError, "Invalid direction: '#{direction}', 'N, S, E, W' accepted"
    end

    @direction = Direction.load_direction(direction, @x, @y)
  end

end