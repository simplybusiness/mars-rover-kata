require 'ostruct'

class Rover
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    validation(x, y, direction)

    @x = x
    @y = y
    @coordinates = OpenStruct.new(x: x, y: y)
    @direction = direction
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

      case @y
      when 11
        @y = -10
      when -11
        @y = 10
      end

      case @x
      when 11
        @x = -10
      when -11
        @x = 10
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
      @y += 1
    when "S"
      @y -= 1
    when "E"
      @x += 1
    when "W"
      @x -= 1
  end
end

def step_backward
  case @direction
    when "N"
      @y -= 1
    when "S"
      @y += 1
    when "E"
      @x -= 1
    when "W"
      @x += 1
  end
end
