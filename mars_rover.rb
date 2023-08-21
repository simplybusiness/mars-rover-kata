require 'ostruct'
class MarsRover
  attr_reader :direction, :starting_point
  def initialize(direction: 'N' , starting_point: OpenStruct.new(x: 0,y: 0))
    @direction = direction
    @starting_point = starting_point
  end

  def execute(commands: [])
    if commands.include? 'f'
      move_forward
    elsif commands.include? 'b'
      move_backwards
    end
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
