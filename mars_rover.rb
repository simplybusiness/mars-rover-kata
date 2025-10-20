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
      if %w[l r].include?(command)
        set_direction(rotate(command))
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

  def move(total_displacement, command)
    if command == 'f'
      move_forwards(total_displacement: total_displacement)
    else
      move_backwards(total_displacement: total_displacement)
    end
  end

  def rotate(command)
    direction_modifier = if command == 'l'
                           -1
                         else
                           1
                         end
    VALID_DIRECTIONS[(current_direction_index + direction_modifier) % 4]
  end

  def current_direction_index
    VALID_DIRECTIONS.index(current_direction)
  end

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

  def set_direction(new_direction)
    @current_direction = new_direction
  end
end
