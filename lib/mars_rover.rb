require 'location'
class MarsRover

  def initialize(map:, starting_location:)
    @map = map
    @current_location = starting_location
  end

  def execute(commands)
    @current_location =
      commands.inject(@current_location) do |location, command|
        case command
        when 'b'
          backwards(location)
        when 'f'
          forwards(location)
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

  def forwards(current_location)
    @map.next_location_forwards(location: current_location)
  end

  def backwards(current_location)
    @map.next_location_backwards(location: current_location)
  end
end