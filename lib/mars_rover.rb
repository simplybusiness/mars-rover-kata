class MarsRover
    def initialize(x , y, direction = 'N')
      @x = x
      @y = y
      @current_direction = direction
    end
  
    def current_position
      [@x, @y]
    end
  
    def current_direction
      @current_direction
    end

    def inspect
      "#{@x},#{@y},#{@current_direction}"
    end

    def execute(commands)
      if commands.first == "f"
        move_forward
      elsif commands.first == "b"  
        move_backward 
      end
      "#{@x},#{@y},#{@current_direction}"
    end

    def move_forward
      if @current_direction == "N" 
        @y = @y + 1
      elsif @current_direction == "E"
        @x = @x + 1
      elsif @current_direction == "S"
         @y= @y - 1
      elsif @current_direction == "W"
         @x = @x - 1
      end
    end

    def move_backward
      if @current_direction == "N" 
      @y = @y -1  
      elsif @current_direction == "E"
      @x = @x - 1
      elsif @current_direction == "S"
       @y= @y + 1
      elsif @current_direction == "W"
       @x = @x + 1
      end
    end 
 
  end 
  