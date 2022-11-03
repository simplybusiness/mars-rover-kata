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
      @current_position.public_send(command_mapping[command])
    end

    @coordinate
  end
end
