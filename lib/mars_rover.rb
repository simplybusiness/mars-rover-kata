require_relative 'coordinate'
require_relative 'compass'
require_relative 'current_position'
class MarsRover
  attr_accessor :compass, :commands, :coordinate

  def initialize(starting_coordinate_x:, starting_coordinate_y:, starting_direction:, commands: [])
    @commands = commands
    @compass = Compass.new(starting_direction)
    @coordinate = Coordinate.new(starting_coordinate_x, starting_coordinate_y)
    @current_position = CurrentPosition.new(@compass, @coordinate)
  end

  def move
    @commands.each do |command|
      case command
      when 'l'
        @current_position.public_send(:left)
      when 'r'
        @current_position.public_send(:right)
      when 'f'
        @current_position.public_send(:move_forward)
      when 'b'
        @current_position.public_send(:move_backward)
      end
    end

    @coordinate
  end
end
