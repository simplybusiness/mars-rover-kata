class Rover
  attr_reader :x, :y, :direction

  DIRECTIONS = %i[N E S W].freeze

  COMMANDS = {
    'f' => :move_forward,
    'b' => :move_backward,
    'r' => :turn_right,
    'l' => :turn_left
  }.freeze

  MOVEMENT = {
    N: { x: 0, y: 1 },
    E: { x: 1, y: 0 },
    S: { x: 0, y: -1 },
    W: { x: -1, y: 0 }
  }.freeze

  def initialize(x:, y:, direction:, grid: nil)
    @x = x
    @y = y
    @direction = direction
    @grid = grid
    @obstacle_detected = false
  end

  def obstacle_detected?
    @obstacle_detected
  end

  def execute(commands)
    commands.each do |command|
      send(COMMANDS[command]) if COMMANDS.key?(command)
    end
  end

  private

  def move_forward
    delta = MOVEMENT[@direction]
    @x += delta[:x]
    @y += delta[:y]
    wrap_coordinates
  end

  def wrap_coordinates
    return unless @grid

    @x = @grid.wrap_x(@x)
    @y = @grid.wrap_y(@y)
  end

  def turn_left
    current_index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(current_index - 1) % 4]
  end

  def turn_right
    current_index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(current_index + 1) % 4]
  end

  def move_backward
    delta = MOVEMENT[@direction]
    @x -= delta[:x]
    @y -= delta[:y]
    wrap_coordinates
  end
end
