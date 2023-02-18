# frozen_string_literal: true
require 'ostruct'
require_relative 'coordinates'
# Mars Rover
class MarsRover
  attr_reader :orientation, :coordinates, :position

  def initialize(x:, y:, orientation:)
    @position = Coordinates.new(x: x, y: y)
    @orientation = orientation
  end

  def rotate_right(current_orientation)
    case current_orientation
      when "N"
        "E"
      when "E"
        "S"
      when "S"
        "W"
      when "W"
        "N"
      else
        current_orientation
    end
  end

  def execute(series_of_instructions)
    commands = series_of_instructions.chars
    commands.each do |command|
      case command
        when "f"
          direction = + 1
        when "b"
          direction = - 1
        when "r"
          @orientation = rotate_right(@orientation)
          direction = 0
        when "l"
          @orientation = "W"
          direction = 0
        else
          direction = 0
      end

      case @orientation 
        when "N"
          @position = Coordinates.new(x: @position.x, y: @position.y + direction)
        when "E"
          @position = Coordinates.new(x: @position.x + direction, y: @position.y)
        when "S"
          @position = Coordinates.new(x: @position.x, y: @position.y - direction)
        when "W"
          @position = Coordinates.new(x: @position.x - direction, y: @position.y)
        else
          @position
      end
    end
  end
end
