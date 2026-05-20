# frozen_string_literal: true

require_relative 'compass'

# This class represents the rover, including its position, direction, and the grid it operates on.
# It can execute movement and turning commands while checking for obstacles.
class Rover
  attr_reader :x, :y

  COMMANDS = {
    'f' => :move_forward,
    'b' => :move_backward,
    'r' => :turn_right,
    'l' => :turn_left
  }.freeze

  def initialize(x:, y:, direction:, grid: nil)
    @x = x
    @y = y
    @compass = Compass.new(direction)
    @grid = grid
    @obstacle_detected = false
  end

  def direction
    @compass.direction
  end

  def obstacle_detected?
    @obstacle_detected
  end

  def execute(commands)
    @obstacle_detected = false
    commands.each do |command|
      break if @obstacle_detected

      send(COMMANDS[command]) if COMMANDS.key?(command)
    end
  end

  private

  def move_forward
    attempt_move(1)
  end

  def move_backward
    attempt_move(-1)
  end

  def attempt_move(multiplier)
    new_x, new_y = next_position(multiplier)

    if @grid&.obstacle_at?(new_x, new_y)
      @obstacle_detected = true
      return
    end

    @x = new_x
    @y = new_y
  end

  def next_position(multiplier)
    delta = @compass.delta
    new_x = @x + (delta[:x] * multiplier)
    new_y = @y + (delta[:y] * multiplier)
    return [new_x, new_y] unless @grid

    [@grid.wrap_x(new_x), @grid.wrap_y(new_y)]
  end

  def turn_left
    @compass = @compass.turn_left
  end

  def turn_right
    @compass = @compass.turn_right
  end
end
