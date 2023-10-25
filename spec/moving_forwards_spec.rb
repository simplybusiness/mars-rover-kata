require 'mars_rover_helper'
describe 'Moving forwards' do
  [
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'N'),
      expected_position: Coordinates.new(x: 0, y: 1)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 2), direction: 'N'),
      expected_position: Coordinates.new(x: 0, y: 3)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 2), direction: 'N'),
      expected_position: Coordinates.new(x: 1, y: 3)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'E'),
      expected_position: Coordinates.new(x: 1, y: 0)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 1), direction: 'S'),
      expected_position: Coordinates.new(x: 0, y: 0)
    },
    {
      mars_rover: MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 0), direction: 'W'),
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
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: direction)

      expect { mars_rover.execute(['f']) }.not_to change(mars_rover, :direction)
    end
  end

  it 'can move forwards multiple times' do
    mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'N')

    mars_rover.execute(%w{f f f f})

    expect(mars_rover).to be_located_at(Coordinates.new(x: 0, y: 4))
  end

  context "when the rover is at or near the planet's edges" do
    it 'can move to the right-hand edge of the planet from the x-axis' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 9, y: 0), direction: 'E')

      mars_rover.execute(['f'])

      right_hand_edge = Coordinates.new(x: 10, y: 0)
      expect(mars_rover).to be_located_at(right_hand_edge)
    end

    it 'can move from the right-hand edge of the planet and reappear at the left-hand edge from the x-axis' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 10, y: 0), direction: 'E')

      mars_rover.execute(['f'])

      left_hand_edge = Coordinates.new(x: 0, y: 0)
      expect(mars_rover).to be_located_at(left_hand_edge)
    end

    it 'can move from the right-hand edge of the planet and reappear at the left hand from anywhere on the planet' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 10, y: 5), direction: 'E')

      mars_rover.execute(['f'])

      left_hand_edge = Coordinates.new(x: 0, y: 5)
      expect(mars_rover).to be_located_at(left_hand_edge)
    end

    it 'can move to the left-hand edge of the planet' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 5), direction: 'W')

      mars_rover.execute(['f'])

      left_hand_edge = Coordinates.new(x: 0, y: 5)
      expect(mars_rover).to be_located_at(left_hand_edge)
    end

    it 'can move from the left-hand edge of the planet and reappear at the right-hand edge' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 0), direction: 'W')

      mars_rover.execute(['f'])

      right_hand_edge = Coordinates.new(x: 10, y: 0)
      expect(mars_rover).to be_located_at(right_hand_edge)
    end

    it 'can move from the left-hand edge of the planet from anywhere on that edge and reappear on the right hand edge' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 1), direction: 'W')

      mars_rover.execute(['f'])

      right_hand_edge = Coordinates.new(x: 10, y: 1)
      expect(mars_rover).to be_located_at(right_hand_edge)
    end

    it 'can move to the top edge of the planet' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 9), direction: 'N')

      mars_rover.execute(['f'])

      top_edge = Coordinates.new(x: 0, y: 10)
      expect(mars_rover).to be_located_at(top_edge)
    end

    it 'can move from the top edge of the planet and reappear at the bottom edge' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 0, y: 10), direction: 'N')

      mars_rover.execute(['f'])

      bottom_edge = Coordinates.new(x: 0, y: 0)
      expect(mars_rover).to be_located_at(bottom_edge)
    end
    it 'can move to the bottom edge of the planet' do
      mars_rover = MarsRover.new(map: Map.new, starting_position: Coordinates.new(x: 1, y: 1), direction: 'S')

      mars_rover.execute(['f'])

      bottom_edge = Coordinates.new(x: 1, y: 0)
      expect(mars_rover).to be_located_at(bottom_edge)
    end

    it 'can move from the bottom edge of the planet and reappear at the top edge'
  end
end
