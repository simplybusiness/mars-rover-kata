# frozen_string_literal: true

class MarsRover # rubocop:disable Style/Documentation
  attr_reader :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction:)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end

  def execute(_instructions = [])
    # Return: New coordinates and direction after moving according to instructions
    case @direction
    when :south
      @y_coordinate -= 1
    when :west
      @x_coordinate -= 1
    when :north
      @y_coordinate += 1
    end
  end

  def inspect
    "A Mars Rover at (#{@x_coordinate}, #{@y_coordinate}) facing #{@direction}"
  end
end
