class Coordinate
  attr_accessor :x, :y, :x_position, :y_position

  def initialize(x = 0, y = 0, x_pos: 0, y_pos: 0)
    raise ArgumentError.new('coordinates must be integers') unless x_pos.is_a?(Integer) && y_pos.is_a?(Integer)
    @x = x_pos
    @y = y_pos
    @x_position = x_pos
    @y_position = y_pos
  end

end
