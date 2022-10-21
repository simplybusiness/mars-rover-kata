class Coordinate 
  attr_accessor :x, :y 

  def initialize(x, y)
    @x = x
    @y = y
  end

  def up
    @y += 1
    self
  end
end
