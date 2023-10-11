# frozen_string_literal: true

class InvalidMarsRoverDirection < StandardError; end
class InvalidMarsRoverGeoLocation < StandardError; end

class MarsRover
  attr_reader :x_pos, :y_pos, :cardinal_direction

  CARDINAL_DIRECTIONS = %w[N E S W].freeze

  def initialize(x_pos:, y_pos:, cardinal_direction:)
    raise InvalidMarsRoverDirection unless CARDINAL_DIRECTIONS.include?(cardinal_direction)
    raise InvalidMarsRoverGeoLocation unless numeric?(x_pos) && numeric?(y_pos)

    @x_pos = x_pos.to_i
    @y_pos = y_pos.to_i
    @cardinal_direction = cardinal_direction.to_s
  end

  def change_position(routes_list)
    current_xpos = @x_pos
    current_ypos = @y_pos

    routes_list.route_steps.each do | route_step |
      current_ypos += 1
    end

    @y_pos = current_ypos
  end
end

private

def numeric?(position)
  position.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/).nil? ? false : true
end
