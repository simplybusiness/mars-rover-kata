# frozen_string_literal: true
require 'ostruct'
require_relative 'coordinates'
# Mars Rover
class MarsRover
  attr_reader :orientation, :coordinates

  def initialize(x,y,orientation)
    @coordinates = OpenStruct.new(x: x, y: y)
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
      @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y + direction)
      @position = Coordinates.new(x: @position.x, y: @position.y + direction)
    end
  end
end

