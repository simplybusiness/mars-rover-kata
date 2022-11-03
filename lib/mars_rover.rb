require_relative 'coordinate'
require_relative 'compass'
require_relative 'current_position'
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
        CurrentPosition.new(@compass, @coordinate).move_forward
      when 'b'
        CurrentPosition.new(@compass, @coordinate).move_backward
      end
    end

    @coordinate
  end
end
