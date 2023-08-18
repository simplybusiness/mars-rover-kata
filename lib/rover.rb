class Rover
    attr_reader :position, :direction
    
    def initialize (coordinates:[0,0], direction:'N')
        @position = coordinates
        @direction = direction
    end

    def move (route)
      if route.any?
          raise ArgumentError
      end
    end
end