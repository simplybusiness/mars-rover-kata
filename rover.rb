class Rover
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    validation(x, y, direction)

    @x = x
    @y = y
    @direction = direction
  end

  def validation(x, y, direction)
    if(x.nil? || y.nil? || direction.nil?)
      raise ArgumentError, "x, y or direction is nil"
    end

    if(!x.is_a?(Integer) || !y.is_a?(Integer))
      raise ArgumentError, "x or y is not a number"
    end

    if(!["N", "S", "E", "W"].include?(direction) || direction.length > 1)
      raise ArgumentError, "direction is not N, S, E, or W"
    end
  end

  def move(directions)
    foreach(directions) do |d|
      direction = d
    end
  end
end
