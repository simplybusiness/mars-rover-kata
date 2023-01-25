require 'pry'

class Movement
  attr_reader :x, :y

  def move(command, direction, start_x, start_y)
    final_pos = [start_x, start_y]
    command.tap { |move_command|
      if direction == 'n'
        final_pos[1] = final_pos[1] + 1 if move_command == 'f'
        final_pos[1] = final_pos[1] - 1 if move_command == 'b'
      end
      if direction == 's'

        final_pos[1] = final_pos[1] - 1 if move_command == 'f'
        final_pos[1] = final_pos[1] + 1 if move_command == 'b'
      end
      if direction == 'e'
        final_pos[0] = final_pos[0] + 1 if move_command == 'f'
        final_pos[0] = final_pos[0] - 1 if move_command == 'b'
      end
      if direction == 'w'
        final_pos[0] = final_pos[0] - 1 if move_command == 'f'
        final_pos[0] = final_pos[0] + 1 if move_command == 'b'
      end
    }
    final_pos
  end

end
