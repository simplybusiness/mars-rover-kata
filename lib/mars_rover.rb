class MarsRover
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  attr_reader :x, :y

  def coordinates
    [@x, @y]
  end
end
