require 'pry'
require 'current_position'

class MarsRover
  attr_reader :x, :y

  def move(command, direction, start_x, start_y)
    current_position = CurrentPosition.new(direction, start_x, start_y)
    final_pos = [current_position.x, current_position.y]
    command.tap { |move_command|
      case current_position.direction
      when 'n'
        final_pos[1] = current_position.y + 1 if move_command == 'f'
        final_pos[1] = current_position.y - 1 if move_command == 'b'
      when 's'
        final_pos[1] = current_position.y - 1 if move_command == 'f'
        final_pos[1] = current_position.y + 1 if move_command == 'b'
      when 'e'
        final_pos[0] = current_position.x + 1 if move_command == 'f'
        final_pos[0] = current_position.x - 1 if move_command == 'b'
      when 'w'
        final_pos[0] = current_position.x - 1 if move_command == 'f'
        final_pos[0] = current_position.x + 1 if move_command == 'b'
      end
    }
    final_pos
  end

  def execute(command, direction, start_x, start_y)
    move(command, direction, start_x, start_y)
  end
end
