class Coordinates
  def initialize(x, y)
    @x_coordinate = x
    @y_coordinate = y
  end

  def inspect
    "(#{@x_coordinate}, #{@y_coordinate})"
  end

  def ==(other)
    true
  end
end