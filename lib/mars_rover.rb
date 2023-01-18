class MarsRover
  attr_reader :direction
  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def coordinates
    [@x, @y]
  end

  def move(commands)
    commands.each do |command|
      if command == 'w'
        @y += 50
      elsif command == 's'
        @y -= 50  
      end
    end
  end
end
