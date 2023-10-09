# frozen_string_literal: true

class InvalidMarsRoverDirection < StandardError; end
class InvalidMarsRoverGeoLocation < StandardError; end

class MarsRover
  attr_reader :x_pos, :y_pos, :cardinal_direction

  CARDINAL_DIRECTIONS = %w[N E S W].freeze

  def initialize(x_pos:, y_pos:, cardinal_direction:)
    raise InvalidMarsRoverDirection unless CARDINAL_DIRECTIONS.include?(cardinal_direction)
    raise InvalidMarsRoverGeoLocation unless numeric?(x_pos) && numeric?(y_pos)

    @x_pos = x_pos.to_f
    @y_pos = y_pos.to_f
    @cardinal_direction = cardinal_direction.to_s
  end
end

private

def numeric?(position)
  position.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/).nil? ? false : true
end
