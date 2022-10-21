class MarsRover
  attr_accessor :starting_coordinate_x, :starting_coordinate_y, :starting_direction, :commands

  def initialize(starting_coordinate_x:, starting_coordinate_y:, starting_direction:, commands: [])
    @starting_coordinate_x = starting_coordinate_x
    @starting_coordinate_y = starting_coordinate_y 
    @starting_direction = starting_direction
    @commands = commands
  end
end
