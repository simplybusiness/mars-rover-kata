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
    routes_list.route_steps.each do | route_step |
      if route_step == 'f'
        case cardinal_direction
        when 'N'
          @y_pos += 1
        when 'S'
          @y_pos -= 1
        when 'E'
          @x_pos += 1
        when 'W'
          @x_pos -= 1
        end
      elsif route_step == 'b'
        case cardinal_direction
        when 'N'
          @y_pos -= 1
        when 'S'
          @y_pos += 1
        when 'E'
          @x_pos -= 1
        when 'W'
          @x_pos += 1
        end
      end
    end
  end
end

private

def numeric?(position)
  position.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/).nil? ? false : true
end
