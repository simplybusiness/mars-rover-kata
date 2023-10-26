require 'location'
class MarsRover

  def initialize(starting_position:, direction:, map:)
    @map = map
    @current_location = Location.new(coordinates: starting_position, direction: direction)
  end

  def execute(commands)
    @current_location =
      commands.inject(@current_location) do |location, command|
        case command
        when 'b'
          backwards(current_location: location)
        when 'f'
          forwards(current_location: location)
        when 'l'
          location.rotate_left
        when 'r'
          location.rotate_right
        else
          location
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
    "a Mars Rover located at #{@current_location.inspect}"
  end

  private

  def forwards(current_location:)
    Location.new(
      coordinates: @map.next_coordinate_forwards(current_position: current_location.coordinates, direction: current_location.direction),
      direction: current_location.direction
    )
  end

  def backwards(current_location:)
    Location.new(
      coordinates: @map.next_coordinate_backwards(current_position: current_location.coordinates, direction: current_location.direction),
      direction: current_location.direction
    )
  end
end