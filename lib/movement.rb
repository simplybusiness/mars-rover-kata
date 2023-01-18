require 'pry'

class Movement
  attr_reader :x, :y

  def move(command, direction, start_x, start_y)
    final_pos = [start_x, start_y]
    command.tap { |m|
      if direction == 'n'
        final_pos[1] = final_pos[1] + 1 if m == 'f'
        final_pos[1] = final_pos[1] - 1 if m == 'b'
      end
      if direction == 's'
        final_pos[1] = final_pos[1] - 1 if m == 'f'
        final_pos[1] = final_pos[1] + 1 if m == 'b'
      end
      if direction == 'e'
        final_pos[0] = final_pos[0] + 1 if m == 'f'
        final_pos[0] = final_pos[0] - 1 if m == 'b'
      end
      if direction == 'w'
        final_pos[0] = final_pos[0] - 1 if m == 'f'
        final_pos[0] = final_pos[0] + 1 if m == 'b'
      end
    }
    final_pos
  end

  def turn(command, direction)
    case direction
    when 'n'


  end
end
