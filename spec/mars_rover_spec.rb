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

    it 'raises an exception when the initial direction is outside the cardinal four' do
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

    it 'raises an exception when an invalid x position is initialised' do
      expect{
        rover = MarsRover.new('a', 1, 'north')
      }.to raise_error(ArgumentError)
    end

    it 'raises an exception when an invalid y position is initialised' do
      expect{
        rover = MarsRover.new(1, 'b', 'north')
      }.to raise_error(ArgumentError)
    end

    it 'has an initial position away from the origin'
    it 'initially faces north'
    it 'initially faces east'
  end
end