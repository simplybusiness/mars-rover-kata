class MarsRover
  attr_reader :starting_position
  def initialize(starting_position: [0,0])
    @starting_position = starting_position
  end
end