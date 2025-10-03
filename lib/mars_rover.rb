require 'coordinates'
class MarsRover
  attr_reader :current_position, :current_direction

  def initialize(starting_position:, starting_direction:)
    if !['N', 'E', 'W', 'S'].include? starting_direction
      raise "Invalid direction"
    end
    @current_position = starting_position
    @current_direction = starting_direction
  end

  def execute(commands:)
    move_forward
  end

  def move_forward
    case current_direction
    when 'N'
      @current_position = [@current_position[0], @current_position[1] + 1]
    when 'E'
      @current_position = [@current_position[0] + 1, @current_position[1]]
    when 'S'
      @current_position = [@current_position[0], @current_position[1] - 1]
    when 'W'
      @current_position = [@current_position[0] - 1, @current_position[1]]
    end
  end

  def x_coordinate
    @current_position[0]
  end

  def y_coordinate
    @current_position[1]
  end
end