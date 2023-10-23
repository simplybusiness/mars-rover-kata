class MarsRover
  attr_reader :current_position, :direction

  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  def initialize(starting_position:, direction:)
    @right_hand_edge = 10
    @left_hand_edge = -10
    @current_position = starting_position
    @direction = direction
  end

  def execute(commands)
    commands.each do |command|
      case command
      when 'b'
        @current_position = move_backwards
      when 'f'
        @current_position = move_forwards
      when 'l'
        @direction = turn_left
      when 'r'
        @direction = turn_right
      end
    end
  end

  def inspect
    "a Mars Rover located at #{@current_position} facing #{@direction}"
  end

  private

  def turn_right
    TURN_LEFT.invert[@direction]
  end

  def turn_left
    TURN_LEFT[@direction]
  end

  def move_backwards
    case @direction
    when 'N'
      Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
    when 'E'
      Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
    when 'S'
      Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    when 'W'
      Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
    end
  end

  def move_forwards
    case @direction
    when 'N'
      Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    when 'E'
      if at_right_hand_edge?(@current_position)
        Coordinates.new(x: @left_hand_edge, y: 0)
      else
        Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
      end
    when 'S'
      Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
    when 'W'
      Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
    end
  end

  def at_right_hand_edge?(position)
    position.x == @right_hand_edge
  end
end