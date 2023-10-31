require 'mars_rover_helper'
describe 'Moving forwards' do
  def self.mars_rover(map: Map.new(x_domain: (0..10), y_domain: (-9..9)), located_at:)
    MarsRover.new(map: map, starting_location: located_at)
  end
  private_class_method :mars_rover

  [
    {
      mars_rover: mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: 'N')),
      expected_position: Coordinates.new(x: 0, y: 1)
    },
    {
      mars_rover: mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 2), direction: 'N')),
      expected_position: Coordinates.new(x: 0, y: 3)
    },
    {
      mars_rover: mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 1, y: 2), direction: 'N')),
      expected_position: Coordinates.new(x: 1, y: 3)
    },
    {
      mars_rover: mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: 'E')),
      expected_position: Coordinates.new(x: 1, y: 0)
    },
    {
      mars_rover: mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 1), direction: 'S')),
      expected_position: Coordinates.new(x: 0, y: 0)
    },
    {
      mars_rover: mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 1, y: 0), direction: 'W')),
      expected_position: Coordinates.new(x: 0, y: 0)
    }
  ].each do |row|
    example "#{row[:mars_rover].inspect} moves forwards to #{row[:expected_position]}" do
      mars_rover = row[:mars_rover]

      mars_rover.execute(['f'])

      expect(mars_rover).to be_located_at(row[:expected_position])
    end
  end

  %w{N E S W}.each do | direction |
    it "never changes direction from #{direction}" do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: direction))

      expect { mars_rover.execute(['f']) }.not_to change(mars_rover, :direction)
    end
  end

  it 'can move forwards multiple times' do
    mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: 'N'))

    mars_rover.execute(%w{f f f f})

    expect(mars_rover).to be_located_at(Coordinates.new(x: 0, y: 4))
  end

  context "when the rover is at or near the planet's edges" do
    it 'can move to the right-hand edge of the planet from the x-axis' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 17, y: 0), direction: 'E'))

      mars_rover.execute(['f'])

      right_hand_edge = Coordinates.new(x: 18, y: 0)
      expect(mars_rover).to be_located_at(right_hand_edge)
    end

    it 'can move from the right-hand edge of the planet and reappear at the left-hand edge from the x-axis' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 18, y: 0), direction: 'E'))

      mars_rover.execute(['f'])

      left_hand_edge = Coordinates.new(x: -18, y: 0)
      expect(mars_rover).to be_located_at(left_hand_edge)
    end

    it 'can move from the right-hand edge of the planet and reappear at the left hand from anywhere on the planet' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 18, y: 5), direction: 'E'))

      mars_rover.execute(['f'])

      left_hand_edge = Coordinates.new(x: -18, y: 5)
      expect(mars_rover).to be_located_at(left_hand_edge)
    end

    it 'can move to the left-hand edge of the planet' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: -17, y: 5), direction: 'W'))

      mars_rover.execute(['f'])

      left_hand_edge = Coordinates.new(x: -18, y: 5)
      expect(mars_rover).to be_located_at(left_hand_edge)
    end

    it 'can move from the left-hand edge of the planet and reappear at the right-hand edge' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: -18, y: 0), direction: 'W'))

      mars_rover.execute(['f'])

      right_hand_edge = Coordinates.new(x: 18, y: 0)
      expect(mars_rover).to be_located_at(right_hand_edge)
    end

    it 'can move from the left-hand edge of the planet from anywhere on that edge and reappear on the right hand edge' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: -18, y: 1), direction: 'W'))

      mars_rover.execute(['f'])

      right_hand_edge = Coordinates.new(x: 18, y: 1)
      expect(mars_rover).to be_located_at(right_hand_edge)
    end

    it 'can move along any edge of the planet' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 5, y: 10), direction: 'W'))

      mars_rover.execute(%w{f f f})

      point_on_the_edge = Coordinates.new(x: 2, y: 10)
      expect(mars_rover).to be_located_at(point_on_the_edge)
    end
  end

  context 'moving towards the north and south pole' do
    it 'can move to the north pole of the planet' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 8), direction: 'N'))

      mars_rover.execute(['f'])

      top_edge = Coordinates.new(x: 18, y: 8)
      expect(mars_rover).to be_located_at(top_edge)
    end

    it 'faces south upon reaching the north pole' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 8), direction: 'N'))

      mars_rover.execute(['f'])

      expect(mars_rover).to be_facing('S')
    end

    it 'can move to the north pole from any longitude' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 1, y: 8), direction: 'N'))

      mars_rover.execute(['f'])

      expect(mars_rover).to be_located_at(Coordinates.new(x: 19, y: 8))
    end

    it 'faces north upon reaching the south pole' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: -8), direction: 'S'))

      mars_rover.execute(['f'])

      expect(mars_rover).to be_facing('N')
    end

    it 'can move to the south pole of the planet' do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: -8), direction: 'S'))

      mars_rover.execute(['f'])

      expect(mars_rover).to be_located_at(Coordinates.new(x: 18, y: -8))
    end
  end

  private

  def a_mars_rover(map: Map.new(x_domain: (-18..18), y_domain: (-9..9)), located_at:)
    MarsRover.new(map: map, starting_location: located_at)
  end
end
