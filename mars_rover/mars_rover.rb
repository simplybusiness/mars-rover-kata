require 'ostruct'

class MarsRover
  attr_reader :current_position, :direction

  def initialize(starting_point: OpenStruct.new(x: 0, y: 0), direction: 'N')
    @current_position = starting_point
    raise ArgumentError, "Direction must be one of 'N', 'E', 'S', 'W'" unless %w[N E S W].include?(direction)
    @direction = direction
  end

  def inspect
    'a Mars Rover'
  end
end
