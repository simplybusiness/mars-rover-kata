class MarsRover
  attr_reader :current_position

  def initialize(starting_position:)
    @current_position = starting_position
  end
end