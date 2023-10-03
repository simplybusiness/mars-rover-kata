class MarsRover
  attr_reader :current_position, :direction

  def initialize(starting_position:)
    @current_position = starting_position
    @direction = 'S'
  end
end