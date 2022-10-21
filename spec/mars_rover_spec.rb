require_relative '../lib/mars_rover.rb'

describe MarsRover do
  let(:starting_coordinate_x) { 0 }
  let(:starting_coordinate_y) { 0 }
  let(:starting_direction) { 'N' }

  context 'when give an initial position' do
    it 'has an initial starting point and direction' do
      expect(mars_rover.starting_coordinate_x).to eq 0
      expect(mars_rover.starting_coordinate_y).to eq 0
      expect(mars_rover.starting_direction).to eq 'N'
    end
  end

  context 'when given a set of commands' do
    it 'has an initial set of commands' do
      expect(mars_rover.commands).to eq []
    end

    it 'moves forward by 1' do
      ending_position = { x: 0, y: 1 }
      commands = ['f']
      expect(mars_rover(commands: commands).move).to eq ending_position
    end

    xit 'moves forward by 2'

    xit 'moves backward by 1'
    
    xit 'moves backward by 2'

    xit 'moves from a starting position of (0, 3)'

    xit 'moves from a starting position of (3, 2)'

    xit 'moves from a starting direction of E'

    xit 'moves from a starting direction of W with a starting position of (2, 5)'

  end
end

def mars_rover(commands = [])
  MarsRover.new(starting_coordinate_x: starting_coordinate_x, starting_coordinate_y: starting_coordinate_y, starting_direction: starting_direction, commands: commands)
end


