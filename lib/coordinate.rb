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

  def down
    @y -= 1
    self
  end

  def right
    @x += 1
    self
  end

  def left
    @x -= 1
    self
  end
end
