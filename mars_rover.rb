require 'ostruct'
class MarsRover

  def starting_point
    OpenStruct.new(x: 0, y: 0)
  end
  def direction
    'N'
  end
end
