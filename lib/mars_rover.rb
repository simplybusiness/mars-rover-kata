class MarsRover
  attr_reader :current_position, :direction

  def initialize(starting_position:, direction:)
    @current_position = starting_position
    @direction = direction
  end

  def execute(commands)
    if @direction == 'E'
      @current_position = Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
    else
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    end
  end

  def inspect
    "a Mars Rover located at #{@current_position} facing #{@direction}"
  end
end