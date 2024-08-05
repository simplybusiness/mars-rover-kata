class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def inspect
    "CoOrd object is set to: (#{@x},#{@y})"
  end

  def ==(coordObj)
    @x == coordObj.x && @y == coordObj.y
  end

  def to_struc
    {
      'x' => @x,
      'y' => @y,
    }
  end

  def addX
    @x = @x + 1
  end
end