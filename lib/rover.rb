require 'coordinates'
require 'pry-byebug'

class Rover
  attr_reader :position, :direction

  MOVE_COMMANDS = %w[f b]
  TURN_COMMANDS = %w[r l]
  DIRECTIONS = %w[N E S W]
  # BOUNDARY = 100
  @@x_axis_max = 100
  @@y_axis_max = 100

  def self.update_map_size(x_axis_max:, y_axis_max:)
    @@x_axis_max = x_axis_max
    @@y_axis_max = y_axis_max
  end

  def initialize(position, direction)
    raise ArgumentError, 'Position should be a Coordinate data type' unless position.is_a?(Coordinates)
    raise ArgumentError, 'Direction is not valid, use one of (N,S,E,W)' unless DIRECTIONS.include?(direction)

    @position = position
    @direction = direction
  end

  def execute(commands)
    raise ArgumentError, 'Commands should be of Char Array or String format' unless
    (commands.is_a? Array) || (commands.is_a? String)

    for i in 0...commands.length do
      move(commands[i]) if MOVE_COMMANDS.include? commands[i]
      turn(commands[i]) if TURN_COMMANDS.include? commands[i]
    end
  end

  def move(command)
    check_and_wrap_edge
    case @direction
    when 'N'
      @position.y += 1 if command == 'f'
      @position.y -= 1 if command == 'b'
    when 'S'
      @position.y -= 1 if command == 'f'
      @position.y += 1 if command == 'b'
    when 'W'
      @position.x -= 1 if command == 'f'
      @position.x += 1 if command == 'b'
    when 'E'
      @position.x += 1 if command == 'f'
      @position.x -= 1 if command == 'b'
    end
    remove_west_and_south_edge
  end

  def check_and_wrap_edge
    @position.x *= -1 if @position.x.abs == @@x_axis_max
    @position.y *= -1 if @position.y.abs == @@y_axis_max
  end

  def remove_west_and_south_edge
    @position.x *= -1 if @position.x == -@@x_axis_max
    @position.y *= -1 if @position.y == -@@y_axis_max
  end

  def turn(command)
    case command
    when 'l'
      @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % 4]
    when 'r'
      @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % 4]
    end
  end
end
