require 'ostruct'
class MarsRover
  attr_accessor :direction, :starting_point
  def initialize
    @direction = "N"
    @starting_point = OpenStruct.new(x: 0, y: 0)
  end
  def starting_point
    @starting_point
  end

end
