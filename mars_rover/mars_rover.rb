class MarsRover
  attr_reader :current_position, :direction

  def initialize(starting_point:, direction: 'N')
    @current_position = starting_point
    direction = direction.upcase
    raise ArgumentError, "Direction must be one of 'N', 'E', 'S', 'W'" unless %w[N E S W].include?(direction)
    @direction = direction
  end

  def inspect
    'a Mars Rover'
  end
end
