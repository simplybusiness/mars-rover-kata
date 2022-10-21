require_relative '../lib/mars_rover.rb'

describe MarsRover do
  context 'when give an initial position' do
    it 'has an initial starting point and direction' do
      starting_coordinate_x = 0
      starting_coordinate_y = 0
      starting_direction = 'N'

      mars_rover = MarsRover.new(starting_coordinate_x: starting_coordinate_x, starting_coordinate_y: starting_coordinate_y, starting_direction: starting_direction)

      expect(mars_rover.starting_coordinate_x).to eq 0
      expect(mars_rover.starting_coordinate_y).to eq 0
      expect(mars_rover.starting_direction).to eq 'N'
    end
  end

  context 'when given a set of commands' do
    it 'has an initial set of commands' do
      starting_coordinate_x = 0
      starting_coordinate_y = 0
      starting_direction = 'N'
      commands = []

      mars_rover = MarsRover.new(starting_coordinate_x: starting_coordinate_x, starting_coordinate_y: starting_coordinate_y, starting_direction: starting_direction, commands: commands)

      expect(mars_rover.commands).to eq []
    end
  end
end

