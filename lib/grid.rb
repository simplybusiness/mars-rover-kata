# frozen_string_literal: true

# This class represents the grid on which the rover operates, including its dimensions and any obstacles present
class Grid
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
