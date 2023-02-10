class Coordinates
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(point)
    return true if @x == point.x
  end
end