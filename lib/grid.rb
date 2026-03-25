class Grid
  attr_reader :width, :height

  def initialize(width:, height:)
    @width = width
    @height = height
  end

  def wrap_x(x)
    x % @width
  end

  def wrap_y(y)
    y % @height
  end
end
