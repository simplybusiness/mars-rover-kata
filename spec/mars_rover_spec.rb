require 'rspec'
require 'mars_rover'

RSpec.describe 'Rover Class Tests' do
  before(:context) do
  end

  context "Initializing the rover" do
    it 'has an initial position at the origin, with a direction' do
      rover = MarsRover.new(0, 0, 'E')

      expect(rover.position).to eq [0,0]
      expect(rover.direction).to eq "E"
    end

    it 'raises an exception when the initial direction is outside the cardinal four' do
      rover = MarsRover.new(0, 0, 'N')

      expect(rover.direction).to eq "N"

      rover = MarsRover.new(0, 0,'S')

      expect(rover.direction).to eq "S"

      rover = MarsRover.new(0, 0,'E')

      expect(rover.direction).to eq "E"

      rover = MarsRover.new(0, 0,'W')

      expect(rover.direction).to eq "W"

      expect{
        rover = MarsRover.new(0, 0, 'notavaliddirection')
      }.to raise_error(ArgumentError)
    end

    it 'raises an exception when an invalid x position is initialised' do
      expect{
        rover = MarsRover.new('a', 1, 'N')
      }.to raise_error(ArgumentError)
    end

    it 'raises an exception when an invalid y position is initialised' do
      expect{
        rover = MarsRover.new(1, 'b', 'N')
      }.to raise_error(ArgumentError)
    end

    example 'has an initial position away from the origin' do
      rover = MarsRover.new(2, 3, 'E')

      x, y = rover.position

      expect(x).to eq 2
      expect(y).to eq 3
      expect(rover.direction).to eq 'E'
    end

    it 'initially faces N'
    it 'initially faces E'
  end
end