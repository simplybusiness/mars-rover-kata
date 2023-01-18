class MarsRover
  attr_reader :position, :direction, :commands

  def initialize(x:, y:, facing_direction:, commands: [])
    @position = Position.new(x: x, y: y)
    @direction = Direction.new(facing_direction: facing_direction)
    @commands = commands
  end

  def move
    @commands.each do |command|
      @position.up
    end
  end
end
