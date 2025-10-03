require_relative '../lib/mars_rover'

RSpec.describe 'Mars Rover' do
  positions = [
    [1, 1],
    [0, 5],
    [0, 0],
    [-1, 4]
  ]

  positions.each do |position|
    it "knows its current position (#{position})" do
      mars_rover = MarsRover.new(starting_position: position, starting_direction: 'N')
      expected_coordinates = Coordinates.new(x: position[0], y: position[1])
      expect(mars_rover.current_coordinates).to eq(expected_coordinates)
    end
  end

  directions = ['N', 'E', 'W', 'S']

  directions.each do |direction|
    it "knows its current direction (#{direction})" do
      mars_rover = MarsRover.new(starting_position: [1,1], starting_direction: direction)
      expect(mars_rover.current_direction).to eq(direction)
    end
  end

  it 'complains that it does not have a starting position' do
    expect{ MarsRover.new(starting_direction: 'N') }.to raise_error(StandardError)
  end
  it 'complains that it does not have a direction' do
    expect{ MarsRover.new(starting_position: [1,1]) }.to raise_error(StandardError)
  end

  it 'complains when it has a direction that is not N, E, S, W' do
    expect{ MarsRover.new(starting_position: [1,1], starting_direction: 'X') }.to raise_error(StandardError)
  end

  it 'receives a character array of commands from Earth' do
    mars_rover = MarsRover.new(starting_position: [-1, 1], starting_direction: 'S')

    expect(mars_rover).to respond_to(:execute).with_keywords(:commands)
  end

  describe 'moving forward' do
    example 'when it is facing north' do
      mars_rover = mars_rover_facing('N')

      expect { mars_rover.execute(commands: ['f']) }.to change(mars_rover, :y_coordinate).by 1
      expect { mars_rover.execute(commands: ['f']) }.not_to change(mars_rover, :x_coordinate)
    end

    example 'when it is facing east' do
      mars_rover = mars_rover_facing('E')

      expect { mars_rover.execute(commands: ['f']) }.to change(mars_rover, :x_coordinate).by 1
      expect { mars_rover.execute(commands: ['f']) }.not_to change(mars_rover, :y_coordinate)
    end

    example 'when it is facing south' do
            mars_rover = mars_rover_facing('S')

      expect { mars_rover.execute(commands: ['f']) }.to change(mars_rover, :y_coordinate).by -1
      expect { mars_rover.execute(commands: ['f']) }.not_to change(mars_rover, :x_coordinate)
    end

    example 'when it is facing west' do
      mars_rover = mars_rover_facing('W')

      expect { mars_rover.execute(commands: ['f']) }.to change(mars_rover, :x_coordinate).by -1
      expect { mars_rover.execute(commands: ['f']) }.not_to change(mars_rover, :y_coordinate)
    end
    private

    def mars_rover_facing(direction)
      irrelevant = [0, 0]
      MarsRover.new(starting_position: irrelevant, starting_direction: direction)
    end
  end
end