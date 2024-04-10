class MarsRover
  attr_accessor :x, :y, :direction

  def initialize(x: 0, y: 0, direction: 'N')
    @x = x
    @y = y
    @direction = direction
  end

  def execute(commands)
    if @direction == 'N'
      @y += 1
    elsif @direction == 'E'
      @x += 1
    elsif @direction == 'S'
      @y -= 1
    elsif @direction == 'W'
      @x -= 1
    end
  end
end
