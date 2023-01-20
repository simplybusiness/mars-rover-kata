# frozen_string_literal: true
require 'ostruct'
# Mars Rover
class MarsRover
  attr_accessor :orientation

  def initialize(x,y,orientation)
    @x = x
    @y = y
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
        @y = @y + 1
        @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y + 1)
      when "b"
        @y = @y - 1
        @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y - 1)
      end
    end
  end
end

