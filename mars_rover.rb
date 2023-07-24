require 'ostruct'
class MarsRover
  attr_accessor :direction
  def initialize
    @direction = "N"
  end
  def starting_point
    OpenStruct.new(x: 0, y: 0)
  end

end
