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
end

