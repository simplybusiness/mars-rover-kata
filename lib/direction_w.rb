class DirectionW < Direction
  def forward
    @x += -1
  end

  def backward
    @x += 1
  end

  def name
    'W'
  end
end