class MarsRover
  attr_accessor :starting_direction, :commands, :coordinate

  def initialize(starting_coordinate_x:, starting_coordinate_y:, starting_direction:, commands: [])
    @starting_direction = starting_direction
    @commands = commands
    @coordinate = Coordinate.new(starting_coordinate_x, starting_coordinate_y)
  end

  def move
    @commands.each do |command|
      case @starting_direction
      when 'N'
        case command
        when 'f'
          @coordinate.up
        when 'b'
          @coordinate.down
        end
      when 'S'
        case command
        when 'f'
          @coordinate.down
        when 'b'
          @coordinate.up
        end
      when 'E'
        case command
        when 'f'
          @coordinate.right
        when 'b'
          @coordinate.left
        end
      when 'W'
        case command
        when 'f'
          @coordinate.left
        when 'b'
          @coordinate.right
        end
      end
    end

    @coordinate
  end
end
