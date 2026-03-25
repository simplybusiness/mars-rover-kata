class Compass
  attr_reader :direction

  DIRECTIONS = %i[N E S W].freeze

  MOVEMENT = {
    N: { x: 0, y: 1 },
    E: { x: 1, y: 0 },
    S: { x: 0, y: -1 },
    W: { x: -1, y: 0 }
  }.freeze

  def initialize(direction)
    @direction = direction
  end

  def turn_left
    current_index = DIRECTIONS.index(@direction)
    Compass.new(DIRECTIONS[(current_index - 1) % 4])
  end

  def delta
    MOVEMENT[@direction]
  end

  def turn_right
    current_index = DIRECTIONS.index(@direction)
    Compass.new(DIRECTIONS[(current_index + 1) % 4])
  end
end
