# frozen_string_literal: true

class InvalidMarsRover < StandardError
end

class MarsRover
  attr_reader :x_pos, :y_pos, :cardinal_direction

  CARDINAL_DIRECTIONS = %w[N E S W].freeze

  def initialize(x_pos, y_pos, cardinal_direction)
    @x_pos = x_pos
    @y_pos = y_pos
    @cardinal_direction = cardinal_direction
    raise InvalidMarsRover unless CARDINAL_DIRECTIONS.include?(cardinal_direction)
  end
end
