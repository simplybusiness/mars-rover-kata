class Grid
  attr_reader :width, :height

  def initialize(width:, height:)
    @width = width
    @height = height
  end

  def wrap_x(x)
    x % @width
  end
end
