class MarsRover
  attr_reader :current_position, :direction

  def initialize(starting_position:, direction:)
    @current_position = starting_position
    @direction = direction
  end

  def execute(commands)
    commands.each do |command|
      case command
      when 'b'
        @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
      when 'f'
        move_forwards
      end
    end
  end

  def inspect
    "a Mars Rover located at #{@current_position} facing #{@direction}"
  end

  private

  def move_forwards
    case @direction
    when 'N'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    when 'E'
      @current_position = Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
    when 'S'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
    when 'W'
      @current_position = Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
    end
  end
end