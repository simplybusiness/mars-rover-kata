class MarsRover
  attr_reader :direction

  def initialize(coords, direction)
    @coords = coords
    @direction = direction
  end

  def current_position
    [@coords.x, @coords.y]
  end

  def execute(commands)
    commands.split("").each do |letter|
      if letter == "f"
        move_forward
      elsif letter == 'b'
        move_backwards
      end
    end
  end  

  private

  def move_backwards
    if @direction == 'N'
      @coords = OpenStruct.new(x: @coords.x, y: @coords.y - 1)
    elsif @direction == 'S'
      @coords = OpenStruct.new(x: @coords.x, y: @coords.y + 1)
    elsif @direction == 'W'
      @coords = OpenStruct.new(x: @coords.x + 1, y: @coords.y)
    end
  end

  def move_forward
    case @direction
    when 'N'
      @coords = OpenStruct.new(x: @coords.x, y: @coords.y + 1)
    when 'S'
      @coords = OpenStruct.new(x: @coords.x, y: @coords.y - 1)
    when 'W'
      @coords = OpenStruct.new(x: @coords.x - 1, y: @coords.y)
    when 'E'
      @coords = OpenStruct.new(x: @coords.x + 1, y: @coords.y)
    end
  end
end
