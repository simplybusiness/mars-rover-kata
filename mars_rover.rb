# frozen_string_literal: true
require_relative 'coordinates'
# Mars Rover
class MarsRover
  attr_reader :orientation, :coordinates, :position

  def initialize(x:, y:, orientation:)
    @position = Coordinates.new(x: x, y: y)
    @orientation = orientation
  end

  def ==(place)
    @position == place.position && @orientation == place.orientation
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
      @position = move_forward(distance: 1)
    when "b"
      @position = move_backwards(distance: 1)
    when "r"
      @orientation = rotate_right(@orientation)
    when "l"
      @orientation = rotate_left(@orientation)
    else
      @position
    end
  end

  def move_forward(distance:)
    move_forward_or_backwards(distance)
  end

  def move_backwards(distance:)
    move_forward_or_backwards(-distance)
  end

  def move_forward_or_backwards(distance)
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

  def rotate_right(current_orientation)
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

  def rotate_left(current_orientation)
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
