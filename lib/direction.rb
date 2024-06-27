class Direction
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def forward
    throw new Exception 'Forward not implemented'
  end

  def backward
    throw new Exception 'Backward not implemented'
  end

  def left
    throw new Exception 'Left not implemented'
  end

  def right
    throw new Exception 'Right not implemented'
  end

  def self.load_direction(direction, x, y)
    Object.const_get('Direction' + direction).new(x, y)
  end
end

