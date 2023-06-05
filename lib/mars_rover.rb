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
      if @direction == 'N' 
        @coords = OpenStruct.new(x: @coords.x, y: @coords.y + 1)
      elsif @direction == "S"
        @coords = OpenStruct.new(x: @coords.x, y: @coords.y - 1)
      end

    end
  end  
end
