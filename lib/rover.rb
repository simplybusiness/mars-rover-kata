class Rover 
  attr_reader :position, :direction

  def initialize(position, direction)
    @position = position
    @direction = direction

    raise 'Invalid position' unless valid_position?
  end

  private

  def valid_position?
    return false unless @position

    # TODO: For now assume that a valid position is an array of two integers
    @position.length == 2
  end
end
