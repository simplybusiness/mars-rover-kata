class Rover
  attr_reader :x, :y, :direction

  DIRECTIONS = %i[N E S W].freeze

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
      when 'r'
        turn_right
      end
    end
  end

  private

  def move_forward
    delta = MOVEMENT[@direction]
    @x += delta[:x]
    @y += delta[:y]
  end

  def turn_right
    current_index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(current_index + 1) % 4]
  end

  def move_backward
    delta = MOVEMENT[@direction]
    @x -= delta[:x]
    @y -= delta[:y]
  end
end
