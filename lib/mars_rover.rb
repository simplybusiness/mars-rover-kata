class MarsRover
  attr_reader :current_position, :direction

  def initialize(starting_position:, direction:)
    @current_position = starting_position
    @direction = direction
  end

  def execute(commands)
    commands.each do |command|
      case command
      when 'b'
        move_backwards
      when 'f'
        move_forwards
      when 'l'
        turn_left
      when 'r'
        turn_right
      end
    end
  end

  def inspect
    "a Mars Rover located at #{@current_position} facing #{@direction}"
  end

  private

  def turn_right
    @direction = {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'
    }[@direction]
  end

  def turn_left
    @direction = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }[@direction]
  end

  def move_backwards
    @current_position = @current_position.backwards(@direction)
  end

  def move_forwards
    @current_position = @current_position.forwards(@direction)
  end
end