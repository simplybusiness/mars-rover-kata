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
    @x == coordObj.x
  end
end