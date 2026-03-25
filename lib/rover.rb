class Rover
  attr_reader :x, :y, :direction

  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def execute(commands)
    commands.each do |command|
      case command
      when 'f'
        @y += 1
      when 'b'
        @y -= 1
      end
    end
  end
end
