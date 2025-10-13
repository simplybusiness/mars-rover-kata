# frozen_string_literal: true

class Coordinates
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end

  def current_coordinates
    [@x, @y]
  end

  def change_x(increase: true)
    if increase
      @x += 1
    else
      @x -= 1
    end
  end

  def change_y(increase: true)
    if increase
      @y += 1
    else
      @y -= 1
    end
  end
end
