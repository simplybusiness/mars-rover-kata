class MarsRover
  attr_reader :direction

  def initialize(coords, direction)
    @coords = coords
    @direction = direction
  end

  def starting_point
    [@coords.x, @coords.y]
  end

  def execute(commands)
    
  end  
end
