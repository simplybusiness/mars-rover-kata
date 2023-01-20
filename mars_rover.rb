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

  def execute(commands)
    command = commands.chars
    command.each do |instruction|
      case instruction
      when "f"
        @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y + 1)
      when "b"
        @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y - 1)
      end
    end
  end
end

