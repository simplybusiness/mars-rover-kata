# frozen_string_literal: true
require 'ostruct'
# Mars Rover
class MarsRover
  attr_reader :orientation, :coordinates

  def initialize(x,y,orientation)
    @coordinates = OpenStruct.new(x: x, y: y)
    @orientation = "N"
  end

  def x
    @coordinates.x
  end

  def y
    @coordinates.y
  end

  def execute(series_of_instructions)
    commands = series_of_instructions.chars
    commands.each do |command|
      case command
        when "f"
          direction = + 1
        when "b"
          direction = - 1
      end
      @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y + direction)
    end
  end
end

