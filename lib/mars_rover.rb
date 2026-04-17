class MarsRover
  VALID_DIRECTIONS = %w[N S E W].freeze

  attr_reader :starting_position, :direction

  def initialize(starting_position:, direction:)
    raise ArgumentError, "Invalid starting position: #{starting_position}" unless valid_position?(starting_position)
    raise ArgumentError, "Invalid direction: #{direction}" unless valid_direction?(direction)
    @starting_position = starting_position
    @direction = direction
  end

  def movements(array)
    @movements = array.chars
  end

  private

  # should the mars rover know what valid co-ordinates are?
  def valid_position?(pos)
    pos.is_a?(Array) && pos.size == 2 && pos.all? { |c| c.is_a?(Integer) }
  end

  def valid_direction?(dir)
    VALID_DIRECTIONS.include?(dir)
  end
end