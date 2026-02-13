class MarsRover

  attr_reader :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction: )
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end

  def execute(instructions= [])
    # Return: New coordinates and direction after moving according to instructions
    @y_coordinate += 1
  end
end