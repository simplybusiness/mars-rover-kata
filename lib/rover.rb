class Rover 
  attr_reader :position, :direction

  def initialize(position, direction)
    @position = position
    @direction = direction

    raise 'Invalid position, must be an array of [X, Y]' unless valid_position?
    raise 'Invalid direction, must be one of N,S,W,E' unless valid_direction?
  end

  private

  def valid_position?
    return false unless @position
    return false unless @position.length == 2

    # TODO: For now assume that a valid position is an array of two integers
    @position.all? { |value| value.is_a? Integer }
  end

  def valid_direction?
    %w(N S W E).include? @direction
  end
end
