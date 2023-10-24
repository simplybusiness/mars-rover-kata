class Map
  attr_reader :left_hand_edge, :right_hand_edge

  def initialize
    @right_hand_edge = 10
    @left_hand_edge = -10
  end

  def next_coordinate_forwards(current_position:, direction:)
    case direction
    when 'N'
      Coordinates.new(x: current_position.x, y: current_position.y + 1)
    when 'E'
      if at_right_hand_edge?(current_position)
        Coordinates.new(x: left_hand_edge, y: current_position.y)
      else
        Coordinates.new(x: current_position.x + 1, y: current_position.y)
      end
    when 'S'
      Coordinates.new(x: current_position.x, y: current_position.y - 1)
    when 'W'
      if at_left_hand_edge?(current_position)
        Coordinates.new(x: @right_hand_edge, y: current_position.y)
      else
        Coordinates.new(x: current_position.x - 1, y: current_position.y)
      end
    end
  end

  private

  def at_left_hand_edge?(current_position)
    current_position.x == @left_hand_edge
  end

  def at_right_hand_edge?(position)
    position.x == @right_hand_edge
  end
end
