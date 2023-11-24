class Planet
  attr_reader :east_edge, :west_edge, :north_edge, :south_edge
    
  def initialize(width, height)
    @east_edge = width  / 2
    @west_edge = (width  / 2) * -1
    @north_edge = height / 2
    @south_edge = (height / 2) * -1
  end
end