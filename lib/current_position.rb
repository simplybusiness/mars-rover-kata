class CurrentPosition
  attr_reader :direction, :x, :y

  def initialize(direction, x, y)
    @direction = direction
    @x = x
    @y = y
  end
end
