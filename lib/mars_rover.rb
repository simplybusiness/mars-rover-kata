class MarsRover
  attr_reader :current_position, :direction

  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  def initialize(starting_position:, direction:, map:)
    @map = map
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
    @map.next_coordinate_backwards(current_position: @current_position, direction: @direction)
  end

  def move_forwards
    @map.next_coordinate_forwards(current_position: @current_position, direction: @direction)
  end
end