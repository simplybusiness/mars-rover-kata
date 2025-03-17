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
      "MarsRover located at (#{@x},#{@y}),facing #{@current_direction}"
    end

    def execute(commands)
      command = commands.first
      if command == "f"
       move_forward
      elsif command == "b"  
        move_backward 
      elsif command == "l"
        move_left  
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

    def move_left
      if @current_direction == "N"
       @current_direction = "W"
      elsif @current_direction == "S" 
       @current_direction = "E" 
      elsif @current_direction == "W" 
        @current_direction = "S"
      elsif @current_direction == "E"
        @current_direction = "N"
      end
    end 
  end