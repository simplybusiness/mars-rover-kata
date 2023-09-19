require 'ostruct'
class MarsRover
  attr_reader :direction, :starting_point

  def initialize(direction, starting_point)
    @direction = direction
    @starting_point = starting_point
  end

  def execute(commands: [])
    commands.each do |command|
      case command
      when 'f'
        move_forward
      when 'b'
        move_backwards
      when 'l'
        turn_left
      when 'r'
        turn_right
      end
    end
  end

  def turn_left
    @direction = {'N' => 'W', 'E' => 'N', 'S' => 'E', 'W' => 'S'}[@direction]
  end

  def turn_right
    @direction = {'N' => 'E', 'E' => 'S', 'S' => 'W', 'W' => 'N'}[@direction]
  end

  def move_forward
    @starting_point = {'N' => OpenStruct.new(x:@starting_point.x, y:@starting_point.y + 1),
                       'E' => OpenStruct.new(x:@starting_point.x - 1, y:@starting_point.y),
                       'S' => OpenStruct.new(x:@starting_point.x, y:@starting_point.y - 1),
                       'W' => OpenStruct.new(x:@starting_point.x + 1, y:@starting_point.y)
    }[@direction]
  end

  def move_backwards
    @starting_point = {'N' => OpenStruct.new(x:@starting_point.x, y:@starting_point.y - 1),
                       'E' => OpenStruct.new(x:@starting_point.x + 1, y:@starting_point.y),
                       'S' => OpenStruct.new(x:@starting_point.x, y:@starting_point.y + 1),
                       'W' => OpenStruct.new(x:@starting_point.x - 1, y:@starting_point.y)
    }[@direction]
  end

end
