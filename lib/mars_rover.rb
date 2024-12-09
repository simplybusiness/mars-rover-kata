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
        if @current_direction == "N"
          @y = @y + 1
        elsif @current_direction == "E"
          @x = @x + 1
        end
      end

      "#{@x},#{@y},#{@current_direction}"
    end
  end 
  