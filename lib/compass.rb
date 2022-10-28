class Compass
  attr_accessor :direction

  DIRECTIONS = [ "N", "E", "S", "W"].freeze

  def initialize(direction)
    @direction = direction
  end

  def left
    @direction = DIRECTIONS[DIRECTIONS.find_index(@direction) - 1] 
    self
  end

  def right
    @direction = DIRECTIONS[DIRECTIONS.find_index(@direction) + 1] 
    self
  end
end
