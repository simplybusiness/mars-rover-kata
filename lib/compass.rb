class Compass
  attr_reader :direction

  DIRECTIONS = %i[N E S W].freeze

  def initialize(direction)
    @direction = direction
  end

  def turn_right
    current_index = DIRECTIONS.index(@direction)
    Compass.new(DIRECTIONS[(current_index + 1) % 4])
  end
end
