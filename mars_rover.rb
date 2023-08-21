require 'ostruct'
class MarsRover
  attr_reader :direction, :starting_point
  def initialize(direction: 'N' , starting_point: OpenStruct.new(x: 0,y: 0))
    @direction = direction
    @starting_point = starting_point
  end

  def execute(commands: [])
    commands.each do |command|
      if command == 'f'
        move_forward
      elsif command == 'b'
        move_backwards
      elsif command == 'l'
        turn_left
      elsif command == 'r'
        turn_right
      end
    end
  end

  def turn_left
    @direction = {'N' => 'W', 'E' => 'N', 'S' => 'E', 'W' => 'S'}[@direction]
  end

  def turn_right
    @direction = {'N' => 'E'}[@direction]
  end
  def move_forward
    case @direction
    when 'N'
      @starting_point = OpenStruct.new(x:@starting_point.x, y:@starting_point.y + 1)
    when 'S'
      @starting_point = OpenStruct.new(x:@starting_point.x, y:@starting_point.y - 1)
    when 'E'
      @starting_point = OpenStruct.new(x:@starting_point.x - 1, y:@starting_point.y)
    when 'W'
      @starting_point = OpenStruct.new(x:@starting_point.x + 1, y:@starting_point.y)
    end
  end

  def move_backwards
    case @direction
    when 'N'
      @starting_point = OpenStruct.new(x:@starting_point.x, y:@starting_point.y - 1)
    when 'S'
      @starting_point = OpenStruct.new(x:@starting_point.x, y:@starting_point.y + 1)
    when 'E'
      @starting_point = OpenStruct.new(x:@starting_point.x + 1, y:@starting_point.y)
    when 'W'
      @starting_point = OpenStruct.new(x:@starting_point.x - 1, y:@starting_point.y)
    end
  end

end
