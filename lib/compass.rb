class Compass
  attr_accessor :direction

  def initialize(direction)
    @direction = direction
  end

  def left
    @direction = "W"
    self
  end

  def right
    @direction = "E"
    self
  end
end
