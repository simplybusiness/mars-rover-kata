class MarsRover
  attr_accessor :starting_direction, :commands, :coordinate

  def initialize(starting_coordinate_x:, starting_coordinate_y:, starting_direction:, commands: [])
    @starting_direction = starting_direction
    @commands = commands
    @coordinate = Coordinate.new(starting_coordinate_x, starting_coordinate_y)
  end

  def move
    @commands.each do |command|
      case command
      when 'f'
        @coordinate.up
      when 'b'
        @coordinate.down
      end
    end

    @coordinate
  end
end
