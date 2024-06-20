class DirectionS < Direction
  def forward
    @y += -1
  end

  def backward
    @y += 1
  end

  def name
    'S'
  end
end