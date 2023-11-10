class Coordinate
    attr_accessor :x, :y

    def initialize(x = 0, y = 0)
        @x = x
        @y = y
    end

    def inspect
        "x: #{x} y: #{y}"
    end
end