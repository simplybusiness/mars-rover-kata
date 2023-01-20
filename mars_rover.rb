# frozen_string_literal: true

# Mars Rover
class MarsRover
  attr_accessor :x, :y, :orientation

  def initialize(x,y,orientation)
    @x = x
    @y = y
    @orientation = "N"
  end

  def move(direction)
    if direction == "f"
      +1
    elsif direction == "b"
      -1
    end
  end

  def execute(commands)
    case commands
    when "f"
      @y = @y + 1
    when "b"
      @y = @y - 1      
    end
  end
end

