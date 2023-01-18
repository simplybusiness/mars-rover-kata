class Rover 
  attr_reader :x, :y, :direction

  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def move(command)
    if direction == "N" 
      @y = @y + 1
      
    elsif direction == "S"
      @y = @y - 1
    end


  end
end
