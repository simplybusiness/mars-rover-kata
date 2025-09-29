class Coordinates
    attr_accessor :x, :y

    def initialize(x: 0, y: 0)
      @x = x
      @y = y
    end

    def current_coordinates
      return [@x, @y]
    end
end