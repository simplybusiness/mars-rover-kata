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
    commands.inject(self) do |mars_rover, command|
      case command
      when 'b'
        mars_rover = translate_backwards(mars_rover)
      when 'f'
        mars_rover = translate_forwards(mars_rover)
      when 'l'
        mars_rover = rotate_left(mars_rover)
      when 'r'
        mars_rover = rotate_right(mars_rover)
      end
      mars_rover
    end
  end

  def inspect
    "a Mars Rover located at #{@current_position} facing #{@direction}"
  end

  private

  def rotate_right(mars_rover)
    MarsRover.new(starting_position: mars_rover.current_position, direction: TURN_LEFT.invert[mars_rover.direction])
  end

  def rotate_left(mars_rover)
    MarsRover.new(starting_position: mars_rover.current_position, direction: TURN_LEFT[mars_rover.direction])
  end

  def translate_backwards(mars_rover)
    MarsRover.new(
      starting_position: move_backwards(current_position: mars_rover.current_position, direction: mars_rover.direction),
      direction: mars_rover.direction
    )
  end

  def move_backwards(current_position:, direction:)
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

  def translate_forwards(mars_rover)
    MarsRover.new(starting_position: move_forwards(mars_rover), direction: mars_rover.direction)
  end

  def move_forwards(mars_rover, current_position: nil, direction: nil)
    case mars_rover.direction
    when 'N'
      Coordinates.new(x: mars_rover.current_position.x, y: mars_rover.current_position.y + 1)
    when 'E'
      if at_right_hand_edge?(mars_rover.current_position)
        Coordinates.new(x: @left_hand_edge, y: 0)
      else
        Coordinates.new(x: mars_rover.current_position.x + 1, y: mars_rover.current_position.y)
      end
    when 'S'
      Coordinates.new(x: mars_rover.current_position.x, y: mars_rover.current_position.y - 1)
    when 'W'
      Coordinates.new(x: mars_rover.current_position.x - 1, y: mars_rover.current_position.y)
    end
  end

  def at_right_hand_edge?(position)
    position.x == @right_hand_edge
  end
end