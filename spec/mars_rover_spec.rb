require_relative '../lib/mars_rover.rb'

describe MarsRover do
  let(:starting_coordinate_x) { 0 }
  let(:starting_coordinate_y) { 0 }
  let(:starting_direction) { 'N' }

  context 'when give an initial position' do
    it 'has an initial starting point and direction' do
      expect(mars_rover.coordinate.x).to eq 0
      expect(mars_rover.coordinate.y).to eq 0
      expect(mars_rover.compass.direction).to eq 'N'
    end
  end

  context 'when given a set of commands for going forward and back' do
    it 'has an initial set of commands' do
      expect(mars_rover.commands).to eq []
    end

    it 'moves forward by 1' do
      commands = ['f']

      expect(mars_rover(commands).move.x).to eq 0
      expect(mars_rover(commands).move.y).to eq 1
    end

    it 'moves forward by 2' do
      commands = ['f', 'f']

      expect(mars_rover(commands).move.x).to eq 0
      expect(mars_rover(commands).move.y).to eq 2
    end

    it 'moves backward by 1' do
      commands = ['b']

      expect(mars_rover(commands).move.x).to eq 0
      expect(mars_rover(commands).move.y).to eq -1
    end

    
    it 'moves backward by 2' do
      commands = ['b', 'b']

      expect(mars_rover(commands).move.x).to eq 0
      expect(mars_rover(commands).move.y).to eq -2
    end


    context 'when starting position is (0, 3)' do
      let(:starting_coordinate_x) { 0 }
      let(:starting_coordinate_y) { 3 }

      it 'moves forward twice and backward once' do
        commands = ['f', 'f', 'b']

        expect(mars_rover(commands).move.x).to eq 0
        expect(mars_rover(commands).move.y).to eq 4
      end
    end

    context 'when starting direction is E' do
      let(:starting_direction) { 'E' }

      it 'moves forward twice and backward once' do
        commands = ['f', 'f', 'b']

        expect(mars_rover(commands).move.x).to eq 1
        expect(mars_rover(commands).move.y).to eq 0
      end
    end

    context 'when starting direction is W and starting position is (2,5)' do
      let(:starting_coordinate_x) { 2 }
      let(:starting_coordinate_y) { 5 }
      let(:starting_direction) { 'W' }

      it 'moves forward once and backward twice' do
        commands = ['b', 'f', 'b']

        expect(mars_rover(commands).move.x).to eq 3
        expect(mars_rover(commands).move.y).to eq 5
      end
    end

    context 'when starting direction is S and starting position is (9, -4)' do
      let(:starting_coordinate_x) { 9 }
      let(:starting_coordinate_y) { -4 }
      let(:starting_direction) { 'S' }

      it 'moves forward once and backward twice' do
        commands = ['b', 'f', 'b']

        expect(mars_rover(commands).move.x).to eq 9
        expect(mars_rover(commands).move.y).to eq -3
      end
    end
  end

  context 'when given a set of commands going forward, back, left and right' do
    it 'moves like a knight' do
      commands = ['f', 'f', 'f', 'r', 'f']

      expect(mars_rover(commands).move.x).to eq 1
      expect(mars_rover(commands).move.y).to eq 3
    end
  end
end

def mars_rover(commands = [])
  MarsRover.new(starting_coordinate_x: starting_coordinate_x, starting_coordinate_y: starting_coordinate_y, starting_direction: starting_direction, commands: commands)
end


