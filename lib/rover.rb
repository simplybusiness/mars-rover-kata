class Rover
  attr_reader :x, :y, :direction

  MOVEMENT = {
    N: { x: 0, y: 1 },
    E: { x: 1, y: 0 },
    S: { x: 0, y: -1 },
    W: { x: -1, y: 0 }
  }.freeze

  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def execute(commands)
    commands.each do |command|
      case command
      when 'f'
        move_forward
      when 'b'
        move_backward
      end
    end
  end

  private

  def move_forward
    delta = MOVEMENT[@direction]
    @x += delta[:x]
    @y += delta[:y]
  end

  def move_backward
    delta = MOVEMENT[@direction]
    @x -= delta[:x]
    @y -= delta[:y]
  end
end
