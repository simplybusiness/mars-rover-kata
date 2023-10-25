class Map
  def initialize(top_edge: 10, bottom_edge: 0, left_hand_edge: 0, right_hand_edge: 10)
    @x_domain = (left_hand_edge..right_hand_edge)
    @y_domain = (bottom_edge..top_edge)
  end

  def next_coordinate_forwards(current_position:, direction:)
    case direction
    when 'N'
      next_y = at_top_edge?(current_position) ? @y_domain.begin : current_position.y + 1
      Coordinates.new(x: current_position.x, y: next_y)
    when 'E'
      next_x = at_right_hand_edge?(current_position) ? @x_domain.begin : current_position.x + 1
      Coordinates.new(x: next_x, y: current_position.y)
    when 'S'
      next_y = at_bottom_edge?(current_position) ? @y_domain.end : current_position.y - 1
      Coordinates.new(x: current_position.x, y: next_y)
    when 'W'
      next_x = at_left_hand_edge?(current_position) ? @x_domain.end : current_position.x - 1
      Coordinates.new(x: next_x, y: current_position.y)
    end
  end

  def next_coordinate_backwards(current_position:, direction:)
    case direction
    when 'N'
      Coordinates.new(x: current_position.x, y: current_position.y - 1)
    when 'E'
      Coordinates.new(x: current_position.x - 1, y: current_position.y)
    when 'S'
      Coordinates.new(x: current_position.x, y: current_position.y + 1)
    when 'W'
      Coordinates.new(x: current_position.x + 1, y: current_position.y)
    end
  end

  private

  def at_top_edge?(current_position)
    current_position.y == @y_domain.end
  end

  def at_bottom_edge?(current_position)
    current_position.y == @y_domain.begin
  end

  def at_left_hand_edge?(current_position)
    current_position.x == @x_domain.begin
  end

  def at_right_hand_edge?(position)
    position.x == @x_domain.end
  end
end
