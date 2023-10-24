class Map
  attr_reader :left_hand_edge, :right_hand_edge

  def initialize
    @right_hand_edge = 10
    @left_hand_edge = -10
  end

  def at_right_hand_edge?(position)
    position.x == @right_hand_edge
  end
end
