class DirectionN < Direction
  def forward
    @y += 1
  end

  def backward
    @y += -1
  end

  def name
    'N'
  end
end