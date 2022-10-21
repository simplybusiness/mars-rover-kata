class MarsRover
  attr_accessor :starting_coordinate_x, :starting_coordinate_y

  def initialize(starting_coordinate_x:, starting_coordinate_y:)
    @starting_coordinate_x = starting_coordinate_x
    @starting_coordinate_y = starting_coordinate_y 
  end
end
