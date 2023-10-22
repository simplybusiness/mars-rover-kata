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
        move_backwards
      when 'f'
        move_forwards
      when 'l'
        turn_left
      when 'r'
        if @direction == 'E'
          @direction = 'S'
        elsif @direction == 'N'
          @direction = 'E'
        end
      end
    end
  end

  def inspect
    "a Mars Rover located at #{@current_position} facing #{@direction}"
  end

  private

  def turn_left
    @direction = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }[@direction]
  end

  def move_backwards
      @current_position = case @direction
                          when 'N'
                            Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
                          when 'E'
                            Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
                          when 'S'
                            Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
                          when 'W'
                            Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
                          end
  end

  def move_forwards
    @current_position = case @direction
                        when 'N'
                          Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
                        when 'E'
                          Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
                        when 'S'
                          Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
                        when 'W'
                          Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
                        end
  end
end