require 'rspec'
require 'mars_rover'

RSpec.describe 'Rover Class Tests' do
  before(:context) do
  end

  context "Initializing the rover" do
    it 'has an initial position at the origin, with a direction' do
      rover = MarsRover.new(0, 0, 'east')

      expect(rover.position).to eq [0,0]
      expect(rover.direction).to eq "east"
    end

    it 'can only have a direction of north, south, east and west' do
      rover = MarsRover.new(0, 0, 'north')

      expect(rover.direction).to eq "north"

      rover.setDirection('south')

      expect(rover.direction).to eq "south"

      rover.setDirection('east')

      expect(rover.direction).to eq "east"

      rover.setDirection('west')

      expect(rover.direction).to eq "west"

      expect{
        rover.setDirection('notavaliddirection')
      }.to raise_error("Invalid direction: 'notavaliddirection'")
    end

    it 'can only give an valid direction on initialisation' do
      rover = MarsRover.new(0, 0, 'north')

      expect(rover.direction).to eq "north"

      rover = MarsRover.new(0, 0,'south')

      expect(rover.direction).to eq "south"

      rover = MarsRover.new(0, 0,'east')

      expect(rover.direction).to eq "east"

      rover = MarsRover.new(0, 0,'west')

      expect(rover.direction).to eq "west"

      expect{
        rover = MarsRover.new(0, 0, 'notavaliddirection')
      }.to raise_error("Invalid direction: 'notavaliddirection'")
    end

    it 'has an initial position away from the origin'
    it 'initially faces north'
    it 'initially faces east'
    it 'raises an exception when the direction is outside the cardinal four'
    it 'raises an exception when there is no initial position is specified'
  end
end