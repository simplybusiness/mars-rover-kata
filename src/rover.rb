# frozen_string_literal: true

require_relative './coordinates'

class Rover
  CARDINAL_DIRECTIONS = %w[N S E W].freeze
  TURN_RIGHT_HASH = { 'N' => 'E', 'E' => 'S', 'S' => 'W', 'W' => 'N' }.freeze

  attr_reader :direction, :commands

  def initialize(x: 0, y: 0, direction: 'N')
    # coords are numbers
    raise ArgumentError, 'Invalid coordinates, must be numbers' unless x.is_a?(Numeric) && y.is_a?(Numeric)

    # the direction is valid
    unless CARDINAL_DIRECTIONS.include?(direction)
      raise ArgumentError, "Invalid direction, must be one of #{CARDINAL_DIRECTIONS.join(', ')}"
    end

    @direction = direction
    @coordinates = Coordinates.new(x: x, y: y)
  end

  def current_position
    @coordinates.current_coordinates
  end

  def check_valid_commands(commands)
    # the commands are an array of characters
    unless commands.is_a?(Array) && commands.all? { |c| c.is_a?(String) && c.length == 1 }
      raise ArgumentError, 'Commands must be an array of characters'
    end
  end

  def move(commands: [])
    check_valid_commands(commands)
    commands.each do |command|
      case command.downcase
      when 'f'
        move_forward
      when 'b'
        move_backwards
      when 'l'
        turn_left
      when 'r'
        turn_right
      end
    end
  end

  def move_forward
    case @direction
    when 'N'
      @coordinates.change_y
    when 'S'
      @coordinates.change_y(increase: false)
    when 'E'
      @coordinates.change_x
    when 'W'
      @coordinates.change_x(increase: false)
    end
  end

  def move_backwards
    case @direction
    when 'N'
      @coordinates.change_y(increase: false)
    when 'S'
      @coordinates.change_y
    when 'E'
      @coordinates.change_x(increase: false)
    when 'W'
      @coordinates.change_x
    end
  end

  def turn_left
    @direction = TURN_RIGHT_HASH.invert[@direction]
  end

  def turn_right
    @direction = TURN_RIGHT_HASH[@direction]
  end
end
