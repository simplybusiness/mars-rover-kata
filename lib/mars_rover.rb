class MarsRover
  attr_accessor :starting_coordinate_x, :starting_coordinate_y, :starting_direction

  def initialize(starting_coordinate_x:, starting_coordinate_y:, starting_direction:)
    @starting_coordinate_x = starting_coordinate_x
    @starting_coordinate_y = starting_coordinate_y 
    @starting_direction = starting_direction
  end
end
