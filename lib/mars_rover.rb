class MarsRover
  attr_reader :position, :direction

  def initialize(x:, y:, facing_direction:)
    @position = Position.new(x: x, y: y)
    @direction = Direction.new(facing_direction: facing_direction)
  end
end
