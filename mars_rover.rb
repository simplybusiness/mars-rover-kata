# frozen_string_literal: true

# Mars ROver
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
    else
      1
    end
  end

  def execute(commands)
    process(commands).each do |command|
      @y = @y + (1 * move(command))
    end
  end

  def process(commands)
    commands.chars
  end
end

