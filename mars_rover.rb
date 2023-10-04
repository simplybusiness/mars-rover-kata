# frozen_string_literal: true

class MarsRover
  attr_reader :x_pos, :y_pos, :cardinal_direction

  def initialize(x_pos, y_pos, cardinal_direction)
    @x_pos = x_pos
    @y_pos = y_pos
    @cardinal_direction = cardinal_direction
  end
end
