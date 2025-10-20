# frozen_string_literal: true

class MarsRover
  VALID_DIRECTIONS = %w[N E S W].freeze
  X_AXIS = 0
  Y_AXIS = 1
  private_constant :X_AXIS, :Y_AXIS, :VALID_DIRECTIONS

  attr_reader :current_position, :current_direction

  def initialize(starting_position:, starting_direction:)
    unless starting_position.is_a?(Coordinates)
      raise ArgumentError,
            'Starting position is invalid and must be valid coordinates'
    end
    unless VALID_DIRECTIONS.include?(starting_direction)
      raise ArgumentError, 'Starting direction is invalid and must be N, E, S, or W'
    end

    @current_position = starting_position
    @current_direction = starting_direction
  end

  def execute(commands)
    total_displacement = [0, 0]
    commands.each do |command|
      if ["l", "r"].include?(command)
        rotate(command)
      else
        total_displacement = move(total_displacement, command)
      end             
    end
    set_position(current_position.x + total_displacement[0], current_position.y + total_displacement[1])
  end

  def execute(commands)
    total_displacement = [0, 0]
    commands.each do |command|
      if ["l", "r"].include?(command)
        rotate(command)
      else
        total_displacement = move(total_displacement, command)
      end
    end
    set_position(current_position.x + total_displacement[0], current_position.y + total_displacement[1])
  end

  def inspect
    "Mars rover located at #{current_position.inspect} facing #{current_direction}"
  end

  private

  def move_backwards(total_displacement:)
    case current_direction
    when 'N'
      total_displacement[Y_AXIS] -= 1
    when 'E'
      total_displacement[X_AXIS] -= 1
    when 'W'
      total_displacement[X_AXIS] += 1
    when 'S'
      total_displacement[Y_AXIS] += 1
    end
  end

  def move(total_displacement, command)
    total_displacement = if command == "f"
                              move_forwards(total_displacement: total_displacement)
                          else
                              move_backwards(total_displacement: total_displacement)
                            end
    total_displacement
  end

  def rotate(command)
    if command == "l"
      turn_left
    elsif command == "r"
      turn_right
    end

      # number = command == 'l' ? -1 : 1
      # new_position_index = current_position_index + number % 4
      # @current_direction = VALID_DIRECTIONS[new_position_index]
  end

  def current_direction_index
    VALID_DIRECTIONS.index(current_direction)
  end

  def turn_left
    new_direction_index = current_direction_index - 1 % 4
    @current_direction = VALID_DIRECTIONS[new_direction_index]
  end

  def turn_right
    new_direction_index = current_direction_index + 1 % 4
    @current_direction = VALID_DIRECTIONS[new_direction_index]
  end

  def move_backwards(total_displacement:)
    case current_direction
    when "N"
      total_displacement[Y_AXIS] -= 1
    when "E"
      total_displacement[X_AXIS] -= 1
    when "W"
      total_displacement[X_AXIS] += 1
    when "S"
      total_displacement[Y_AXIS] += 1
    end
    total_displacement
  end

  def move_forwards(total_displacement:)
    case current_direction
    when 'N'
      total_displacement[Y_AXIS] += 1
    when 'E'
      total_displacement[X_AXIS] += 1
    when 'W'
      total_displacement[X_AXIS] -= 1
    when 'S'
      total_displacement[Y_AXIS] -= 1
    end
    total_displacement
  end

  def set_position(x, y)
    @current_position = Coordinates.new(x, y)
  end
end
