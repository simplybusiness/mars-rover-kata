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
  end
end

def mars_rover
  MarsRover.new(starting_coordinate_x: starting_coordinate_x, starting_coordinate_y: starting_coordinate_y, starting_direction: starting_direction)
end


