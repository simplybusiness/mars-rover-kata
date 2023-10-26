require 'mars_rover_helper'
describe 'Rotating a mars rover' do
  def self.mars_rover_facing(direction:)
    MarsRover.new(
      map: Map.new,
      starting_position: Coordinates.new(x: 1, y: 2),
      direction: direction,
      starting_location: Location.new(coordinates: Coordinates.new(x: 1, y: 2), direction: direction)
    )
  end

  describe 'Turning left' do
    [
      {
        mars_rover: mars_rover_facing(direction: 'N'),
        expected_direction: 'W'
      },
      {
        mars_rover: mars_rover_facing(direction: 'E'),
        expected_direction: 'N'
      },
      {
        mars_rover: mars_rover_facing(direction: 'S'),
        expected_direction: 'E'
      },
      {
        mars_rover: mars_rover_facing(direction: 'W'),
        expected_direction: 'S'
      }
    ].each do |row|
      example "a Mars rover facing #{row[:mars_rover].direction} turns left to face #{row[:expected_direction]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['l'])

        expect(mars_rover).to be_facing(row[:expected_direction])
      end
    end

    it 'can turn left multiple times' do
      anywhere = Coordinates.new(x: 0, y: 0)
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: anywhere, direction: 'N'))

      expect { mars_rover.execute(%w{l l}) }.to change(mars_rover, :direction).to 'S'
    end

    it 'remains at its current position' do
      anywhere = Coordinates.new(x: 4, y: 6)
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: anywhere, direction: 'N'))

      expect { mars_rover.execute(['l']) }.not_to change(mars_rover, :current_position)
    end
  end

  describe 'Turning right' do
    [
      {
        mars_rover: mars_rover_facing(direction: 'N'),
        expected_direction: 'E'
      },
      {
        mars_rover: mars_rover_facing(direction: 'E'),
        expected_direction: 'S'
      },
      {
        mars_rover: mars_rover_facing(direction: 'S'),
        expected_direction: 'W'
      },
      {
        mars_rover: mars_rover_facing(direction: 'W'),
        expected_direction: 'N'
      }
    ].each do |row|
      example "a Mars rover facing #{row[:mars_rover].direction} turns right to face #{row[:expected_direction]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['r'])

        expect(mars_rover).to be_facing(row[:expected_direction])
      end
    end

    it 'can turn right multiple times' do
      anywhere = Coordinates.new(x: 3, y: 5)
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: anywhere, direction: 'S'))

      expect { mars_rover.execute(%w{r r r}) }.to change(mars_rover, :direction).to 'E'
    end

    it 'remains at its current position' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 4), direction: 'E'))

      expect { mars_rover.execute(['r']) }.not_to change(mars_rover, :current_position)
    end
  end

  private

  def a_mars_rover(located_at:)
    MarsRover.new(
      map: Map.new,
      starting_position: located_at.coordinates,
      direction: located_at.direction,
      starting_location: located_at
    )
  end
end