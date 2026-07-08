# frozen_string_literal: true

# This class represents the compass direction of the rover and provides methods to turn and decide how the rover moves
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
    turn(-1)
  end

  def turn_right
    turn(1)
  end

  def delta
    MOVEMENT[@direction]
  end

  private

  def turn(offset)
    index = DIRECTIONS.index(@direction)
    Compass.new(DIRECTIONS[(index + offset) % DIRECTIONS.length])
  end
end
