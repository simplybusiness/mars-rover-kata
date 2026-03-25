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
    @obstacle_detected = false
    commands.each do |command|
      break if @obstacle_detected

      send(COMMANDS[command]) if COMMANDS.key?(command)
    end
  end

  private

  def move_forward
    attempt_move(1)
  end

  def move_backward
    attempt_move(-1)
  end

  def attempt_move(multiplier)
    delta = MOVEMENT[@direction]
    new_x = @x + (delta[:x] * multiplier)
    new_y = @y + (delta[:y] * multiplier)

    if @grid
      new_x = @grid.wrap_x(new_x)
      new_y = @grid.wrap_y(new_y)
    end

    if @grid&.obstacle_at?(new_x, new_y)
      @obstacle_detected = true
      return
    end

    @x = new_x
    @y = new_y
  end

  def turn_left
    current_index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(current_index - 1) % 4]
  end

  def turn_right
    current_index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(current_index + 1) % 4]
  end
end
