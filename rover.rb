require 'ostruct'

class Rover
  attr_reader :direction

  def initialize(x, y, direction)
    validation(x, y, direction)

    @coordinates = OpenStruct.new(x: x, y: y)
    @direction = direction
  end

  def x
    @coordinates.x
  end

  def y
    @coordinates.y
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
        step_forward
      when "b"
        step_backward
      when "l"
        rotate_left
      when "r"
        rotate_right
      end

      case @coordinates.y
      when 11
        @coordinates = OpenStruct.new(x: @coordinates.x, y: -10)
      when -11
        @coordinates = OpenStruct.new(x: @coordinates.x, y: 10)
      end

      case @coordinates.x
      when 11
        @coordinates = OpenStruct.new(x: -10, y: @coordinates.y)
      when -11
        @coordinates = OpenStruct.new(x: 10, y: @coordinates.y)
      end
    end
  end
end

def rotate_left
    case @direction
    when "N"
      @direction = "W"
    when "W"
      @direction = "S"
    when "S"
      @direction = "E"
    when "E"
      @direction = "N"
    end
end

def rotate_right
  case @direction
  when "N"
    @direction = "E"
  when "E"
    @direction = "S"
  when "S"
    @direction = "W"
  when "W"
    @direction = "N"
  end
end

def step_forward
  case @direction
    when "N"
      @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y + 1)
    when "S"
      @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y - 1)
    when "E"
      @coordinates = OpenStruct.new(x: @coordinates.x + 1, y: @coordinates.y)
    when "W"
      @coordinates = OpenStruct.new(x: @coordinates.x - 1, y: @coordinates.y)
  end
end

def step_backward
  case @direction
    when "N"
      @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y - 1)
    when "S"
      @coordinates = OpenStruct.new(x: @coordinates.x, y: @coordinates.y + 1)
  when "E"
      @coordinates = OpenStruct.new(x: @coordinates.x - 1, y: @coordinates.y)
    when "W"
      @coordinates = OpenStruct.new(x: @coordinates.x + 1, y: @coordinates.y)
  end
end
