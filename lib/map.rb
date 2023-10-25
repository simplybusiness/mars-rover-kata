class Map
  def initialize(top_edge: 10, bottom_edge: 0, left_hand_edge: 0, right_hand_edge: 10)
    @right_hand_edge = right_hand_edge
    @left_hand_edge = left_hand_edge
    @top_edge = top_edge
    @bottom_edge = bottom_edge
  end

  def next_coordinate_forwards(current_position:, direction:)
    case direction
    when 'N'
      if at_top_edge?(current_position)
        Coordinates.new(x: current_position.x, y: bottom_edge)
      else
        Coordinates.new(x: current_position.x, y: current_position.y + 1)
      end
    when 'E'
      if at_right_hand_edge?(current_position)
        Coordinates.new(x: left_hand_edge, y: current_position.y)
      else
        Coordinates.new(x: current_position.x + 1, y: current_position.y)
      end
    when 'S'
      if at_bottom_edge?(current_position)
        Coordinates.new(x: current_position.x, y: top_edge)
      else
        Coordinates.new(x: current_position.x, y: current_position.y - 1)
      end
    when 'W'
      if at_left_hand_edge?(current_position)
        Coordinates.new(x: right_hand_edge, y: current_position.y)
      else
        Coordinates.new(x: current_position.x - 1, y: current_position.y)
      end
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

  attr_reader :left_hand_edge, :right_hand_edge, :top_edge, :bottom_edge

  def at_top_edge?(current_position)
    current_position.y == @top_edge
  end

  def at_bottom_edge?(current_position)
    current_position.y == @bottom_edge
  end

  def at_left_hand_edge?(current_position)
    current_position.x == @left_hand_edge
  end

  def at_right_hand_edge?(position)
    position.x == @right_hand_edge
  end
end
