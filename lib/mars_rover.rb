class MarsRover

  attr_reader :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction: nil)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end

  def execute(instructions= [])

    # Return: New coordinates and direction after moving according to instructions
  end

    
end