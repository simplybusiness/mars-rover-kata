class Rover 
  attr_reader :x, :y, :direction

  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def move(command)
    if command == "f"
      if direction == "N" 
        @y = @y + 1
      
      elsif direction == "S"
        @y = @y - 1
      
      elsif direction == "E"
        @x = @x + 1
      
      elsif direction == "W"
        @x = @x - 1
      end
    elsif command == "b"
      if direction == "N" 
        @y = @y - 1
      end
    end  


  end
end
