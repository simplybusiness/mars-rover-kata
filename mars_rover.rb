# frozen_string_literal: true

# Mars Rover
class MarsRover
  attr_accessor :x, :y, :orientation

  def initialize(x,y,orientation)
    @x = x
    @y = y
    @orientation = "N"
  end

  def execute(commands)
    command = commands.chars
    command.each do |instruction|
      case instruction
      when "f"
        @y = @y + 1
      when "b"
        @y = @y - 1      
      end
    end
  end
end

