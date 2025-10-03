require 'coordinates'
class MarsRover
  attr_reader :current_position, :current_direction

  def initialize(starting_position:, starting_direction:)
    if !['N', 'E', 'W', 'S'].include? starting_direction
      raise "Invalid direction"
    end
    @current_position = starting_position
    @current_coordinates = Coordinates.new(x: starting_position[0], y: starting_position[1])
    @current_direction = starting_direction
  end

  def execute(commands:)
    move_forward
  end

  def move_forward
    case current_direction
    when 'N'
      @current_position = [@current_position[0], @current_position[1] + 1]
      @current_coordinates = Coordinates.new(x: @current_coordinates.x, y: @current_coordinates.y + 1)
    when 'E'
      @current_position = [@current_position[0] + 1, @current_position[1]]
      @current_coordinates = Coordinates.new(x: @current_coordinates.x + 1, y: @current_coordinates.y)
    when 'S'
      @current_position = [@current_position[0], @current_position[1] - 1]
      @current_coordinates = Coordinates.new(x: @current_coordinates.x, y: @current_coordinates.y - 1)
    when 'W'
      @current_position = [@current_position[0] - 1, @current_position[1]]
      @current_coordinates = Coordinates.new(x: @current_coordinates.x - 1, y: @current_coordinates.y)
    end
  end

  def x_coordinate
    @current_coordinates.x
  end

  def y_coordinate
    @current_coordinates.y
  end
end