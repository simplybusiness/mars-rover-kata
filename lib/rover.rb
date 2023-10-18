# frozen_string_literal: true
#
require 'coordinates'
require 'pry-byebug'

class Rover
  attr_reader :position, :direction

  MOVE_COMMANDS = %w[f b].freeze
  TURN_COMMANDS = %w[r l].freeze
  COORDINATES = %w[N E S W].freeze

  def initialize(position, direction)
    raise ArgumentError, 'Position should be a Coordinate data type' unless position.is_a?(Coordinates)
    raise ArgumentError, 'Direction is not valid, use one of (N,S,E,W)' unless COORDINATES.include?(direction)

    @position = position
    @direction = direction
  end

  def execute(commands)
    raise ArgumentError, 'Commands should be of Char Array or String format' unless
    (commands.is_a? Array) || (commands.is_a? String)

    for i in 0...commands.length do
      next unless (MOVE_COMMANDS.include? commands[i]) || (TURN_COMMANDS.include? commands[i])

      move(commands[i]) if MOVE_COMMANDS.include? commands[i]
    end
  end

  def move(command)
    # return @position.y += 1 if command == 'f'
    # return @position.x += 1 if command == 'b'
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
  end

  # def turn(command)
  # end
end
