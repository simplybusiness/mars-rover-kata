# frozen_string_literal: true

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
    # TODO: Probably it requires input sanitization to remove special charachters like comas, semicolons etc.
    commands = commands.split if commands.is_a? String
    raise ArgumentError, 'Commands should be of Char Array or String format' unless commands.is_a? Array

    move(commands)
  end

  private

  def move(commands)
    commands.each do |command|
      next unless MOVE_COMMANDS.include?(command) || TURN_COMMANDS.include?(command)

      change_position(command) if MOVE_COMMANDS.include?(command)
      change_direction(command) if TURN_COMMANDS.include?(command)
    end
  end

  def change_position(command)
    case @direction
    when 'N', 'S'
      @position.y += 1 if command == 'f'
      @position.y -= 1 if command == 'b'
    when 'W', 'E'
      @position.x -= 1 if command == 'f'
      @position.x += 1 if command == 'b'
    end
  end

  def change_direction(command)
    return @direction = 'W' if direction == 'N' && command == 'l'
    return @direction = 'E' if direction == 'N' && command == 'r'
    return @direction = 'S' if direction == 'W' && command == 'l'
    return @direction = 'N' if direction == 'W' && command == 'r'
    return @direction = 'E' if direction == 'S' && command == 'l'
    return @direction = 'W' if direction == 'S' && command == 'r'
    return @direction = 'N' if direction == 'E' && command == 'l'

    @direction = 'S' if direction == 'E' && command == 'r'
  end
end
