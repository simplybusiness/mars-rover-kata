class MarsRover
  attr_reader :current_position, :direction

  def initialize(starting_position:, direction: 'S')
    @current_position = starting_position
    @direction = direction
  end
end