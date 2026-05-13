# frozen_string_literal: true

class Grid
  attr_reader :width, :height

  def initialize(width:, height:, obstacles: [])
    @width = width
    @height = height
    @obstacles = obstacles
  end

  def wrap_x(x)
    x % @width
  end

  def wrap_y(y)
    y % @height
  end

  def obstacle_at?(x, y)
    @obstacles.include?([x, y])
  end
end
