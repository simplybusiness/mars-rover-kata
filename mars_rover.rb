# frozen_string_literal: true
require_relative 'coordinates'
# Mars Rover
class MarsRover
  attr_reader :orientation, :position

  def initialize(x:, y:, orientation:)
    @position = Coordinates.new(x: x, y: y)
    @orientation = orientation
  end

  def ==(another_position)
    @position == another_position.position && @orientation == another_position.orientation
  end

  def process_movement_commands(series_of_instructions)
    commands = series_of_instructions.chars
    commands.each do |command|
      execute_single_movement_action(command)
    end
  end

  def execute_single_movement_action(command)
    case command
    when "f"
      @position = move(distance: 1) #move(distance: 1)
    when "b"
      @position = move(distance: -1)
    when "r"
      @orientation = rotate_right(current_orientation: @orientation)
    when "l"
      @orientation = rotate_left(current_orientation: @orientation)
    else
      @position
    end
  end

  def move(distance:)
    case @orientation 
    when "N"
      Coordinates.new(x: @position.x, y: @position.y + distance)
    when "E"
      Coordinates.new(x: @position.x + distance, y: @position.y)
    when "S"
      Coordinates.new(x: @position.x, y: @position.y - distance)
    when "W"
      Coordinates.new(x: @position.x - distance, y: @position.y)
    else
      @position
    end
  end

  def rotate_right(current_orientation:)
    case current_orientation
      when "N"
        "E"
      when "E"
        "S"
      when "S"
        "W"
      when "W"
        "N"
      else
        current_orientation
    end
  end

  def rotate_left(current_orientation:)
    case current_orientation
      when "N"
        "W"
      when "W"
        "S"
      when "S"
        "E"
      when "E"
        "N"
      else
        current_orientation
      end
  end
end
