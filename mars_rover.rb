require 'ostruct'
class MarsRover
  attr_writer :direction

  def initialize
    @direction = "N"
  end
  def starting_point
    OpenStruct.new(x: 0, y: 0)
  end
  def direction
    @direction
  end
end
