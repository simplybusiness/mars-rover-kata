# frozen_string_literal: true

# Mars ROver
class MarsRover
  attr_accessor :x, :y, :orientation

  def initialize(x,y,orientation)
    @x = x
    @y = y
    @orientation = "N"
  end

  def rotates(orientation, direction)
    wind_rose = ["N","E","S","W"]
    facing = wind_rose.find_index(orientation)
    if direction == "l"
      @orientation = wind_rose[facing - 1]
    elsif direction == "r"
      @orientation = wind_rose[facing + 1]
    else
      @orientation
    end
  end

  def move(direction)
    if direction == "f"
      +1
    elsif direction == "b"
      -1
    else
      1
    end
  end

  def execute(commands)
    process(commands).each do |command|
      # binding.pry
      # @orientation = rotates(@orientation, command) if commands == ("l" or "r") 
      if command == "r"
        @orientation = rotates(@orientation, "r")
      elsif command == "l"
        @orientation = rotates(@orientation, "l")
      elsif @orientation == "N"
        @y = @y + (1 * move(command))
      elsif @orientation == "S"
        @y = @y - (1 * move(command))
      elsif @orientation == "E"
        @x = @x + (1 * move(command))
      elsif @orientation == "W"
        @x = @x - (1 * move(command))
      else
        @y
      end
    end
  end

  def process(commands)
    commands.chars
  end
end

