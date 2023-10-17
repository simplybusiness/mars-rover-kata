require 'coordinates'
class MarsRover
  attr_reader :current_position, :direction

  def initialize(starting_position:, direction:)
    raise RuntimeError.new('A starting position in the form of coordinates must be provided') if !starting_position.is_a?(Coordinates)
    raise RuntimeError.new('Direction must be one of N, E, S or W') unless %w{N E S W}.include?(direction)
    @current_position = starting_position
    @direction = direction
  end

  def execute(commands)
    @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
  end

  def inspect
    "a Mars Rover located at #{@current_position} facing #{@direction}"
  end
end