require 'rspec'
require 'mars_rover'
require 'direction'
require 'direction_n'
require 'direction_s'
require 'direction_e'
require 'direction_w'

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

    example 'initially faces N' do
      rover = MarsRover.new(2, 3, 'N')

      expect(rover.direction).to eq 'N'
    end

    it 'initially faces E' do
      rover = MarsRover.new(2, 3, 'E')

      expect(rover.direction).to eq 'E'
    end

    example 'the rover can move forwards, facing N' do
      rover = MarsRover.new(0, 0, 'N')

      rover.execute('f')

      x, y = rover.position

      expect(x).to eq 0
      expect(y).to eq 1
      expect(rover.direction).to eq 'N'
    end

    example 'the rover can move backwards, facing N' do
      rover = MarsRover.new(0, 0, 'N')

      rover.execute('b')

      x, y = rover.position

      expect(x).to eq 0
      expect(y).to eq -1
      expect(rover.direction).to eq 'N'
    end

    example 'the rover can move forwards, facing E' do
      rover = MarsRover.new(0, 0, 'E')

      rover.execute('f')

      x, y = rover.position

      expect(x).to eq 1
      expect(y).to eq 0
      expect(rover.direction).to eq 'E'

      rover.execute('f')

      x, y = rover.position

      expect(x).to eq 2
      expect(y).to eq 0
      expect(rover.direction).to eq 'E'
    end

    example 'the rover can move backwards, facing S' do
      rover = MarsRover.new(1, 1, 'S')

      rover.execute('b')

      x, y = rover.position

      expect(x).to eq 1
      expect(y).to eq 2
      expect(rover.direction).to eq 'S'

      rover.execute('b')

      x, y = rover.position

      expect(x).to eq 1
      expect(y).to eq 3
      expect(rover.direction).to eq 'S'
    end

    example 'the rover can move forwards, facing S' do
      rover = MarsRover.new(1, 1, 'S')

      rover.execute('f')

      x, y = rover.position

      expect(x).to eq 1
      expect(y).to eq 0
      expect(rover.direction).to eq 'S'

      rover.execute('f')

      x, y = rover.position

      expect(x).to eq 1
      expect(y).to eq -1
      expect(rover.direction).to eq 'S'
    end

    example 'the rover can turn left, from N to W' do
      rover = MarsRover.new(0, 0, 'N')

      rover.left

      expect(rover.direction).to eq 'W'
    end

    example 'the rover can turn left, from W to S' do
      rover = MarsRover.new(0, 0, 'W')

      rover.left

      expect(rover.direction).to eq 'S'
    end

    example 'the rover can turn right, from N to E' do
      rover = MarsRover.new(0, 0, 'N')

      rover.right

      expect(rover.direction).to eq 'E'
    end

    example 'the rover can turn right, from E to S' do
      rover = MarsRover.new(0, 0, 'E')

      rover.right

      expect(rover.direction).to eq 'S'
    end

    it 'can turn right fron N then go forward E, from 0,0 to 1,0' do
      rover = MarsRover.new(0, 0, 'N')

      rover.right
      rover.execute('f')

      x, y = rover.position

      expect(x).to eq 1
      expect(y).to eq 0
      expect(rover.direction).to eq 'E'
    end

    it 'can recive a list of commands from earth' do
      rover = MarsRover.new(0, 0, 'N')

      expect(rover).to respond_to(:execute).with(1)
    end
  end
end