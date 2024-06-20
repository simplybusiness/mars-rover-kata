class DirectionE < Direction
  def forward
    @x += 1
  end

  def backward
    @x += -1
  end

  def name
    'E'
  end
end