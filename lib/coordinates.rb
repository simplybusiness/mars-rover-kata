class Coordinates
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def y=(distance)
    @y += distance
  end
end
