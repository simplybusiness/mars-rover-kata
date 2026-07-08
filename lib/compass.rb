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

  LEFT_TURNS = { N: :W, W: :S, S: :E, E: :N }.freeze

  RIGHT_TURNS = { N: :E, E: :S, S: :W, W: :N }.freeze

  def turn_left
    Compass.new(LEFT_TURNS[@direction])
  end

  def turn_right
    Compass.new(RIGHT_TURNS[@direction])
  end

  def delta
    MOVEMENT[@direction]
  end
end
