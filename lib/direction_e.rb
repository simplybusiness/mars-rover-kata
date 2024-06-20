class DirectionE < Direction
  def forward
    @x += 1
  end

  def backward
    @x -= 1
  end

  def name
    'E'
  end

  def left
    'N'
  end

  def right
    'S'
  end
end