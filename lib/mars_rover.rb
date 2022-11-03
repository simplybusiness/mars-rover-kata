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
    command_mapping = { 'l' => :left, 'r' => :right, 'f' => :forward, 'b' => :backward}
    @commands.each do |command|
      case command
      when 'l'
        @current_position.public_send(command_mapping['l'])
      when 'r'
        @current_position.public_send(:right)
      when 'f'
        @current_position.public_send(:forward)
      when 'b'
        @current_position.public_send(:backward)
      end
    end

    @coordinate
  end
end
