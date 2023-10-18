require_relative 'spec_helper'
require_relative '../lib/coordinates'
require_relative '../lib/rover'
require 'pry-byebug'

describe Rover do
  describe 'on initialization' do
    let(:position) { Coordinates.new(x: 0, y: 0) }

    it 'raises an error when no initial position is provided' do
      expect { Rover.new }.to raise_error(ArgumentError)
    end

    it 'uses the initial position provided' do
      rover = Rover.new(position, 'N')
      expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
    end

    it 'raises an error for invalid direction -- eg. X (not N, S, W, E)' do
      expect do
        Rover.new(position, 'X')
      end.to raise_error(ArgumentError, 'Direction is not valid, use one of (N,S,E,W)')
    end

    it 'uses the direction provided' do
      %w[N S E W].each do |direction|
        rover = Rover.new(position, direction)
        expect(rover.direction).to eq(direction)
      end
    end

    it 'raises an error when starting position is not of type Coordinates' do
      expect do
        Rover.new('start', 'N')
      end.to raise_error(ArgumentError, 'Position should be a Coordinate data type')
    end
  end

  describe 'when taking commands' do
    let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'N') }

    it 'expects an array of characters' do
      expect { rover.execute(%w[f f r]) }.not_to raise_error
    end

    it 'expects a string' do
      expect { rover.execute('ffr') }.not_to raise_error
    end

    [0, 0.5, { A: 'a' }].each do |commands|
      it "raises an error for wrong input -- eg. '#{commands}'" do
        expect { rover.execute(commands) }.to raise_error ArgumentError
      end
    end

    context 'for commands moving the rover' do
      # ['N','E','S','W'].each do |direction|
      #     context "when facing #{direction}" do

      #     end
      # end

      # context 'when facing North' do
      # end

      # context 'when facing South' do
      # end

      # context 'when facing West' do
      # end

      # context 'when facing East' do
      # end

      it 'moves forward for f' do
        initial_y = rover.position.y
        rover.execute('f')
        expect(rover.position.y).to eq(initial_y + 1)
      end

      it 'moves backwards for b' do
        initial_y = rover.position.y
        rover.execute('b')
        expect(rover.position.y).to eq(initial_y - 1)
      end

      it 'ends up in same position for f-b' do
        initial_y = rover.position.y
        rover.execute('fb')
        expect(rover.position.y).to eq(initial_y)
      end
    end

    context 'for commands other than f,b,l,r' do
      it 'does nothing' do
        initial_y = rover.position.y
        initial_x = rover.position.x
        rover.execute('zs')
        expect(rover.position.x).to eq(initial_x)
        expect(rover.position.y).to eq(initial_y)
      end
    end
  end
end
