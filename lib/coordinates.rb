class Coordinates
  attr_reader :x
  attr_accessor :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end
end
