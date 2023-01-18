class Rover
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    validation(x, y, direction)

    @x = x
    @y = y
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
        when "b"
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
    end
  end
end
