class MarsRover
  attr_reader :current_position, :direction

  VALID_DIRECTIONS = %w[N E S W].freeze

  def initialize(starting_point:, direction: 'N')
    @current_position = starting_point
    @direction = validate_direction(direction)
  end

  def validate_direction(direction)
    direction = (direction || 'N').upcase
    unless VALID_DIRECTIONS.include?(direction)
      raise ArgumentError, "Direction must be one of #{VALID_DIRECTIONS.join(', ')}"
    end

    direction
  end

  def inspect
    'a Mars Rover'
  end
end
