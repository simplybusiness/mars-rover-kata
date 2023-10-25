require 'location'
class MarsRover

  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  def initialize(starting_position:, direction:, map:)
    @map = map
    @current_location = Location.new(coordinates: starting_position, direction: direction)
  end

  def execute(commands)
    commands.each do |command|
      case command
      when 'b'
        @current_location = backwards
      when 'f'
        @current_location = forwards
      when 'l'
        @current_location = rotate_left
      when 'r'
        @current_location = rotate_right
      end
    end
  end

  def current_position
    @current_location.coordinates
  end

  def direction
    @current_location.direction
  end

  def inspect
    "a Mars Rover located at #{@current_position} facing #{@direction}"
  end

  private

  def forwards
    Location.new(
      coordinates: @map.next_coordinate_forwards(current_position: @current_location.coordinates, direction: @current_location.direction),
      direction: @current_location.direction
    )
  end

  def backwards
    Location.new(
      coordinates: @map.next_coordinate_backwards(current_position: @current_location.coordinates, direction: @current_location.direction),
      direction: @current_location.direction
    )
  end

  def rotate_left
    Location.new(
      coordinates: @current_location.coordinates,
      direction: TURN_LEFT[@current_location.direction]
    )
  end

  def rotate_right
    Location.new(
      coordinates: @current_location.coordinates,
      direction: TURN_LEFT.invert[@current_location.direction]
    )
  end
end