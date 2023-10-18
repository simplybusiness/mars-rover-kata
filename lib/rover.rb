# frozen_string_literal: true

require 'coordinates'
require 'pry-byebug'

class Rover
  attr_reader :position, :direction

  MOVE_COMMANDS = %w[f b].freeze
  TURN_COMMANDS = %w[r l].freeze
  COORDINATES = %w[W N E S].freeze
  INCREMENTS = {
    'l' => -1,
    'r' => 1,
    'f' => 1,
    'b' => -1
  }.freeze

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
      @direction = change_direction(command) if TURN_COMMANDS.include?(command)
    end
  end

  def change_position(command)
    return @position.y += INCREMENTS[command] if %w[N S].include?(direction)

    @position.x += INCREMENTS[command] if %w[W E].include?(direction)
  end

  def change_direction(command)
    index = COORDINATES.index(direction)
    return COORDINATES[0] if index == COORDINATES.length - 1 && INCREMENTS[command].possitive?
    return COORDINATES[-1] if index.zero? && INCREMENTS[command].negative?

    COORDINATES[index + INCREMENTS[command]]
  end
end
