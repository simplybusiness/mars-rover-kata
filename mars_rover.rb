# frozen_string_literal: true
require 'ostruct'
require_relative 'coordinates'
# Mars Rover
class MarsRover
  attr_reader :orientation, :coordinates, :position

  def initialize(x:, y:, orientation:)
    @position = Coordinates.new(x: x, y: y)
    @orientation = "N"
  end

  def execute(series_of_instructions)
    commands = series_of_instructions.chars
    commands.each do |command|
      case command
        when "f"
          direction = + 1
        when "b"
          direction = - 1
       else
          direction = 0
      end
      @position = Coordinates.new(x: @position.x, y: @position.y + direction)
    end
  end
end

