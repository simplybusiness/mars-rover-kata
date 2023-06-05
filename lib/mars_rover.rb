class MarsRover
  attr_reader :direction

  def initialize(coords, direction)
    @coords = coords
    @direction = direction
  end

  def current_position
    [@coords.x, @coords.y]
  end

  def execute(commands)
    if commands == "f"
      move_forward
    end
  end  

  private
  
  def move_forward
    case @direction
    when 'N'
      @coords = OpenStruct.new(x: @coords.x, y: @coords.y + 1)
    when 'S'
      @coords = OpenStruct.new(x: @coords.x, y: @coords.y - 1)
    end
  end
end
