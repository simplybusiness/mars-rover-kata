class MarsRover
  attr_accessor :x, :y, :orientation

  def initialize(x,y,orientation)
    @x = x
    @y = y
    @orientation = "N"
  end

  def execute(commands)
    process(commands).each do
      @y = @y + 1
    end
  end

  def process(commands)
    commands.chars
  end
end

