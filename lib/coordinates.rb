class Coordinates
  attr_reader :x_pos, :y_pos

  def initialize(xpos:, ypos:)
    @x_pos = xpos
    @y_pos = ypos
  end
end
