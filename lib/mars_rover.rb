class MarsRover
  attr_reader :current_position, :direction

  def initialize(starting_position:, direction:)
    raise RuntimeError.new('Direction must be one of N, E, S or W') unless %w{N E S W}.include?(direction)
    @current_position = starting_position
    @direction = direction
  end
end