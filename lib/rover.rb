require_relative 'coordinates'
require 'pry-byebug'

class Rover
  attr_reader :position, :direction

  MOVE_COMMANDS = %w[f b].freeze
  TURN_COMMANDS = %w[r l].freeze
  DIRECTIONS = %w[N E S W].freeze

  MOVEMENTS = {
    'N' => { 'f' => ->(pos) { pos.y += 1 }, 'b' => ->(pos) { pos.y -= 1 } },
    'S' => { 'f' => ->(pos) { pos.y -= 1 }, 'b' => ->(pos) { pos.y += 1 } },
    'W' => { 'f' => ->(pos) { pos.x -= 1 }, 'b' => ->(pos) { pos.x += 1 } },
    'E' => { 'f' => ->(pos) { pos.x += 1 }, 'b' => ->(pos) { pos.x -= 1 } }
  }.freeze

  def inspect_plane
    "x-axis max: #{@x_axis_max} | y-axis max: #{@y_axis_max}"
  end

  def update_map_size(x_axis_max:, y_axis_max:)
    @x_axis_max = x_axis_max
    @y_axis_max = y_axis_max
  end

  def initialize(position, direction)
    raise ArgumentError, 'Position should be a Coordinate data type' unless position.is_a?(Coordinates)
    raise ArgumentError, 'Direction is not valid, use one of (N,S,E,W)' unless DIRECTIONS.include?(direction)

    @position = position
    @direction = direction
    @x_axis_max = 100
    @y_axis_max = 100
  end

  def execute(commands)
    raise ArgumentError, 'Commands should be of Char Array or String format' unless
    (commands.is_a? Array) || (commands.is_a? String)

    (0...commands.length).each do |i|
      move(commands[i]) if MOVE_COMMANDS.include? commands[i]
      turn(commands[i]) if TURN_COMMANDS.include? commands[i]
    end
  end

  def move(command)
    MOVEMENTS[@direction][command].call(@position)
    adjust_coordinates
  end

  def adjust_coordinates 
    @position.x = (-@position.x + 1) if @position.x > @x_axis_max
    @position.x = (-@position.x - 1) if @position.x < -@x_axis_max
    @position.y = (-@position.y + 1) if @position.y > @y_axis_max
    @position.y = (-@position.y - 1) if @position.y < -@y_axis_max
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
