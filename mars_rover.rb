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
  def execute(commands)
    @starting_point = OpenStruct.new(x: @starting_point.x,y: @starting_point.y + 1)
  end

end
