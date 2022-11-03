require_relative 'coordinate'
require_relative 'compass'
class MarsRover
  attr_accessor :compass, :commands, :coordinate

  def initialize(starting_coordinate_x:, starting_coordinate_y:, starting_direction:, commands: [])
    @commands = commands
    @compass = Compass.new(starting_direction)
    @coordinate = Coordinate.new(starting_coordinate_x, starting_coordinate_y)
  end

  def move
    @commands.each do |command|
      case command
      when 'l'
        @compass.left
      when 'r'
        @compass.right
      when 'f'
        move_forward
      when 'b'
        case @compass.direction
        when 'N'
          @coordinate.down
        when 'E'
          @coordinate.left
        when 'S'
          @coordinate.up
        when 'W'
          @coordinate.right
        end
      end
    end

    @coordinate
  end

  private

  def move_forward
    case @compass.direction
    when 'N'
      @coordinate.up
    when 'E'
      @coordinate.right
    when 'S'
      @coordinate.down
    when 'W'
      @coordinate.left
    end
  end
end
