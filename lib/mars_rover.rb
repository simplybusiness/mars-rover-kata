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
      end
    end
  end

  def inspect
    "a Mars Rover located at #{@current_position} facing #{@direction}"
  end

  private

  def turn_left
    @direction = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }[@direction]
  end

  def move_backwards
    case @direction
    when 'N'
      move_backwards_command = ->(mars_rover) { Coordinates.new(x: mars_rover.current_position.x, y: mars_rover.current_position.y - 1) }
    when 'E'
      move_backwards_command = ->(mars_rover) { Coordinates.new(x: mars_rover.current_position.x - 1, y: mars_rover.current_position.y) }
    when 'S'
      move_backwards_command = ->(mars_rover) { Coordinates.new(x: mars_rover.current_position.x, y: mars_rover.current_position.y + 1) }
    when 'W'
      move_backwards_command = ->(mars_rover) { Coordinates.new(x: mars_rover.current_position.x + 1, y: mars_rover.current_position.y) }
    end
    @current_position = move_backwards_command.call(self)
  end

  def move_forwards
    case @direction
    when 'N'
      move_forwards_command = ->(mars_rover) { Coordinates.new(x: mars_rover.current_position.x, y: mars_rover.current_position.y + 1) }
    when 'E'
      move_forwards_command = ->(mars_rover) { Coordinates.new(x: mars_rover.current_position.x + 1, y: mars_rover.current_position.y) }
    when 'S'
      move_forwards_command = ->(mars_rover) { Coordinates.new(x: mars_rover.current_position.x, y: mars_rover.current_position.y - 1) }
    when 'W'
      move_forwards_command = ->(mars_rover) { Coordinates.new(x: mars_rover.current_position.x - 1, y: mars_rover.current_position.y) }
    end
    @current_position = move_forwards_command.call(self)
  end
end