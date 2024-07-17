require 'ostruct'
require './mars_rover/mars_rover.rb'

describe 'Mars Rover' do

  describe 'initialization of the mars rover' do
    context 'when the starting point is provided' do
      it 'knows its starting point' do
        mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 0, y: 0))

        expect(mars_rover.current_position).to eq(OpenStruct.new(x: 0, y: 0))
      end

      it 'has a starting point anywhere on the planet' do
        mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 3))

        expect(mars_rover.current_position).to eq(OpenStruct.new(x: 2, y: 3))
      end
    end

    context 'when the starting point is not provided' do
      it 'cannot be initialized w/o a starting point' do
        expect { MarsRover.new(direction: 'N') }.to raise_error(ArgumentError)
      end
    end

    context 'when the direction of the mars rover is provided' do
      it 'knows the direction is facing (N, S, E, W)' do
        mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 3), direction: 'N')

        expect(mars_rover.direction).to eq('N')
      end

      %w[N E S W].each do |direction|
        it "can have a starting direction of #{direction}" do
          mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 3), direction: direction)
          expect(mars_rover.direction).to eq(direction)
        end
      end

      it 'cannot be initialized with a direction outside of (N, S, E, W)' do
        expect { MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 3), direction: 'Z') }.to raise_error(ArgumentError, "Direction must be one of 'N', 'E', 'S', 'W'")
      end

      it 'can accept lowercase directions' do
        mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 3), direction: 'n')
        expect(mars_rover.direction).to eq('N')
      end
    end

    context 'when the direction of the mars rover is not provided' do
      it 'defaults to facing N when no direction is provided' do
        mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 3))

        expect(mars_rover.direction).to eq('N')
      end

      it 'rasies an exception when the direction is nil' do
        expect { MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 3), direction: nil) }.to raise_exception(ArgumentError)
      end
    end
  end
end
