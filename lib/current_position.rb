class CurrentPosition
  def initialize (compass, coordinate)
    @compass = compass
    @coordinate = coordinate
  end

  def right
    @compass.right
  end

  def move_forward
    case @compass.direction
    when 'N'
      @coordinate.up
    when 'E'
      @coordinate.right
    when 'S'
      @coordinate.down
    when 'W'
      @coordinate.left
    end
  end

  def move_backward
    case @compass.direction
    when 'N'
      @coordinate.down
    when 'E'
      @coordinate.left
    when 'S'
      @coordinate.up
    when 'W'
      @coordinate.right
    end
  end
end
