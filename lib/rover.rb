class Rover
  attr_reader :x, :y, :direction

  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def move(commands)
    if direction == 'N'
      @y += 1
    else
      @y -= 1
    end
  end
end
