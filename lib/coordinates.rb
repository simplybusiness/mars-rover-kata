class Coordinates
  attr_reader :x_pos, :y_pos
  
  def initialize(x:, y:)
    @x_pos = x
    @y_pos = y
  end
end
