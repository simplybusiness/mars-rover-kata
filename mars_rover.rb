require 'ostruct'
class MarsRover
  attr_reader :direction, :starting_point
  def initialize(direction: 'N' , starting_point: OpenStruct.new(x: 0,y: 0))
    @direction = direction
    @starting_point = starting_point
  end

  def execute(commands: [])

    x = @starting_point.x
    y = @starting_point.y


    if commands.include? 'f'
      move_forward
    elsif commands.include? 'b'
      case @direction
      when 'N'
        y = @starting_point.y - 1
      when 'S'
        y = @starting_point.y + 1
      when 'E'
        x = @starting_point.x + 1
      when 'W'
        x = @starting_point.x - 1
      else
        x = x
        y = y
      end
      @starting_point = OpenStruct.new(x: x,y: y)
    end


  end

  def move_forward
    x = @starting_point.x
    y = @starting_point.y
    case @direction
    when 'N'
      y = @starting_point.y + 1
    when 'S'
      y = @starting_point.y - 1
    when 'E'
      x = @starting_point.x - 1
    when 'W'
      x = @starting_point.x + 1
    end
    @starting_point = OpenStruct.new(x: x,y: y)
  end

end
