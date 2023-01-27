require 'ostruct'
require_relative 'command'
require_relative 'position'

class Rover
  attr_reader :coordinates, :state

  def initialize(x, y, direction)
    validation(x, y, direction)

    @state = OpenStruct.new(x: x, y: y, direction: direction)
    @current_position = Position.new(x: x, y: y, direction: direction)
  end

  def x
    @state.x
  end

  def y
    @state.y
  end

  def direction
    @state.direction
  end

  def validation(x, y, direction)
    if(x.nil? || y.nil? || direction.nil?)
      raise ArgumentError, "x, y or direction is nil"
    end

    if(!x.is_a?(Integer) || !y.is_a?(Integer))
      raise ArgumentError, "x or y is not a number"
    end

    if(!["N", "S", "E", "W"].include?(direction) || direction.length > 1)
      raise ArgumentError, "direction is not N, S, E, or W"
    end
  end

  def move(directions)
    if(!directions.is_a?(Array))
      raise ArgumentError, "directions is not an array"
    end

    directions.each do |d|
      case d
      when "f"
        @state = Command.step_forward(@state)
      when "b"
        @state = Command.step_backward(@state)
      when "l"
        @state = Command.rotate_left(@state)
        next
      when "r"
        @state = Command.rotate_right(@state)
        next
      end

      wrap_edges
    end
  end
end

def wrap_edges
  case @state.y
  when 11
    @state = OpenStruct.new(x: @state.x, y: -10, direction: @state.direction)
  when -11
    @state = OpenStruct.new(x: @state.x, y: 10, direction: @state.direction)
  end

  case @state.x
  when 11
    @state = OpenStruct.new(x: -10, y: @state.y, direction: @state.direction)
  when -11
    @state = OpenStruct.new(x: 10, y: @state.y, direction: @state.direction)
  end
end
