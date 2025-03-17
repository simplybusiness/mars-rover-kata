# Description: This class represents a position on a x,y grid
class Position
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end
end
