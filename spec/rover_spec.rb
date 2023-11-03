require_relative 'spec_helper'
require_relative '../lib/coordinates'
require_relative '../lib/rover'
require 'pry-byebug'

describe Rover do
  describe '🏎️ on initialization' do
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

  describe '🕹️ when taking commands' do
    let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'N') }

    it 'accepts an array of characters' do
      expect { rover.execute(%w[f f r]) }.not_to raise_error
    end

    it 'accepts a string' do
      expect { rover.execute('ffr') }.not_to raise_error
    end

    [0, 0.5, { A: 'a' }].each do |commands|
      it "raises an error for wrong input type -- eg. '#{commands}'" do
        expect { rover.execute(commands) }.to raise_error ArgumentError
      end
    end

    context 'for commands moving the rover' do
      context 'when facing North' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'N') }

        it 'increases Y-axis value for forward' do
          rover.execute('f')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 1))
        end

        it 'decreases Y-axis value for backward' do
          rover.execute('b')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: -1))
        end

        it 'ends up in the same position for forward + backward' do
          rover.execute('fb')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'ends up in the same position for 2 * forward + 2 * backward' do
          rover.execute('ffbb')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'does nothing for invalid commands -- eg. x + y + z' do
          rover.execute('xyz')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'executes complex commands correctly -- eg. ffbfbff' do
          rover.execute('ffbfbff')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 3))
        end
      end

      context 'when facing South' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'S') }

        it 'decreases Y-axis value for forward' do
          rover.execute('f')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: -1))
        end

        it 'increases Y-axis value for backward' do
          rover.execute('b')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 1))
        end

        it 'ends up in the same position for forward + backward' do
          rover.execute('fb')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'ends up in the same position for 2 * forward + 2 * backward' do
          rover.execute('ffbb')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'does nothing for invalid commands -- eg. x + y + z' do
          rover.execute('xyz')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'executes complex commands correctly -- eg. ffbfbff' do
          rover.execute('ffbfbff')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: -3))
        end
      end

      context 'when facing West' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'W') }

        it 'decreases X-axis value for forward' do
          rover.execute('f')
          expect(rover.position).to eq(Coordinates.new(x: -1, y: 0))
        end

        it 'increases X-axis value for backward' do
          rover.execute('b')
          expect(rover.position).to eq(Coordinates.new(x: 1, y: 0))
        end

        it 'ends up in the same position for forward + backward' do
          rover.execute('fb')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'ends up in the same position for 2 * forward + 2 * backward' do
          rover.execute('ffbb')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'does nothing for invalid commands -- eg. x + y + z' do
          rover.execute('xyz')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'executes complex commands correctly -- eg. ffbfbff' do
          rover.execute('ffbfbff')
          expect(rover.position).to eq(Coordinates.new(x: -3, y: 0))
        end
      end

      context 'when facing East' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'E') }

        it 'increases X-axis value for forward' do
          rover.execute('f')
          expect(rover.position).to eq(Coordinates.new(x: 1, y: 0))
        end

        it 'decreases X-axis value for backward' do
          rover.execute('b')
          expect(rover.position).to eq(Coordinates.new(x: -1, y: 0))
        end

        it 'ends up in the same position for forward + backward' do
          rover.execute('fb')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'ends up in the same position for 2 * forward + 2 * backward' do
          rover.execute('ffbb')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'does nothing for invalid commands -- eg. x + y + z' do
          rover.execute('xyz')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it 'executes complex commands correctly -- eg. ffbfbff' do
          rover.execute('ffbfbff')
          expect(rover.position).to eq(Coordinates.new(x: 3, y: 0))
        end
      end
    end

    context 'for commands turning the rover' do
      context 'when facing North' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'N') }
        it 'changes direction to West for left' do
          rover.execute('l')
          expect(rover.direction).to eq('W')
        end
        it 'changes direction to East for right' do
          rover.execute('r')
          expect(rover.direction).to eq('E')
        end
        it 'ends up in same direction for 4 * left' do
          rover.execute('llll')
          expect(rover.direction).to eq('N')
        end

        it 'ends up in same direction for 4 * right' do
          rover.execute('rrrr')
          expect(rover.direction).to eq('N')
        end
      end

      context 'when facing South' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'S') }
        it 'changes direction to East for left' do
          rover.execute('l')
          expect(rover.direction).to eq('E')
        end
        it 'changes direction to West for right' do
          rover.execute('r')
          expect(rover.direction).to eq('W')
        end

        it 'ends up in same direction for 4 * left' do
          rover.execute('llll')
          expect(rover.direction).to eq('S')
        end
        it 'ends up in same direction for 4 * right' do
          rover.execute('rrrr')
          expect(rover.direction).to eq('S')
        end
      end

      context 'when facing West' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'W') }
        it 'changes direction to South for left' do
          rover.execute('l')
          expect(rover.direction).to eq('S')
        end
        it 'changes direction to North for right' do
          rover.execute('r')
          expect(rover.direction).to eq('N')
        end
        it 'ends up in same direction for 4 * left' do
          rover.execute('llll')
          expect(rover.direction).to eq('W')
        end

        it 'ends up in same direction for 4 * right' do
          rover.execute('rrrr')
          expect(rover.direction).to eq('W')
        end
      end

      context 'when facing East' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'E') }
        it 'changes direction to North for left' do
          rover.execute('l')
          expect(rover.direction).to eq('N')
        end
        it 'changes direction to South for right' do
          rover.execute('r')
          expect(rover.direction).to eq('S')
        end
        it 'ends up in same direction for 4 * left' do
          rover.execute('llll')
          expect(rover.direction).to eq('E')
        end
        it 'ends up in same direction for 4 * right' do
          rover.execute('rrrr')
          expect(rover.direction).to eq('E')
        end
      end
    end

    context 'for commands moving and turning the rover' do
      context 'when facing North' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'N') }
        it 'correctly follows complex commands -- eg. fflfrbll' do
          rover.execute('fflfrbll')
          expect(rover.direction).to eq('S')
          expect(rover.position).to eq(Coordinates.new(x: -1, y: 1))
        end

        it 'correctly follows complex commands -- eg. lffffrbbbb' do
          rover.execute('lffffrbbbb')
          expect(rover.direction).to eq('N')
          expect(rover.position).to eq(Coordinates.new(x: -4, y: -4))
        end
      end

      context 'when facing South' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'S') }
        it 'correctly follows complex commands -- eg. fflfrbll' do
          rover.execute('fflfrbll')
          expect(rover.direction).to eq('N')
          expect(rover.position).to eq(Coordinates.new(x: 1, y: -1))
        end

        it 'correctly follows complex commands -- eg. lffffrbbbb' do
          rover.execute('lffffrbbbb')
          expect(rover.direction).to eq('S')
          expect(rover.position).to eq(Coordinates.new(x: 4, y: 4))
        end
      end

      context 'when facing West' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'W') }
        it 'correctly follows complex commands -- eg. fflfrbll' do
          rover.execute('fflfrbll')
          expect(rover.direction).to eq('E')
          expect(rover.position).to eq(Coordinates.new(x: -1, y: -1))
        end

        it 'correctly follows complex commands -- eg. lffffrbbbb' do
          rover.execute('lffffrbbbb')
          expect(rover.direction).to eq('W')
          expect(rover.position).to eq(Coordinates.new(x: 4, y: -4))
        end
      end

      context 'when facing East' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'E') }
        it 'correctly follows complex commands -- eg. fflfrbll' do
          rover.execute('fflfrbll')
          expect(rover.direction).to eq('W')
          expect(rover.position).to eq(Coordinates.new(x: 1, y: 1))
        end

        it 'correctly follows complex commands -- eg. lffffrbbbb' do
          rover.execute('lffffrbbbb')
          expect(rover.direction).to eq('E')
          expect(rover.position).to eq(Coordinates.new(x: -4, y: 4))
        end
      end
    end

    context 'for a mixture of correct and incorrect commands' do
      let(:rover) { described_class.new(Coordinates.new(x: 0, y: 0), 'N') }
      it 'correctly follows ffxlfyrblzl starting with North direction' do
        rover.execute('ffxlfyrblzl')
        expect(rover.direction).to eq('S')
        expect(rover.position).to eq(Coordinates.new(x: -1, y: 1))
      end
      it 'correctly follows lfx0ff0fyr0bb0bzb starting with North direction' do
        rover.execute('lfx0ff0fyr0bb0bzb')
        expect(rover.direction).to eq('N')
        expect(rover.position).to eq(Coordinates.new(x: -4, y: -4))
      end
    end
  end

  describe '🗺️ for map wrapping scenarios' do
    describe 'when going beyond the limit of' do
      context 'East boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: 100, y: 0), 'E') }
        it 'changes its position to West boundary' do
          rover.execute('f')
          expect(rover.direction).to eq('E')
          expect(rover.position).to eq(Coordinates.new(x: -99, y: 0))
        end
      end
      context 'West boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: -100, y: 0), 'W') }
        it 'changes its position to East boundary' do
          rover.execute('f')
          expect(rover.direction).to eq('W')
          expect(rover.position).to eq(Coordinates.new(x: 99, y: 0))
        end
      end
      context 'North boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 100), 'N') }
        it 'changes its position to South boundary' do
          rover.execute('f')
          expect(rover.direction).to eq('N')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: -99))
        end
      end
      context 'South boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: -100), 'S') }
        it 'changes its position to North boundary' do
          rover.execute('f')
          expect(rover.direction).to eq('S')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 99))
        end
      end
    end
  
    describe 'when going beyond and back from' do
      context 'East boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: 100, y: 0), 'E') }
        it 'changes its position to East boundary' do
          rover.execute('fb')
          expect(rover.direction).to eq('E')
          expect(rover.position).to eq(Coordinates.new(x: 100, y: 0))
        end
      end
      context 'West boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: -100, y: 0), 'W') }
        it 'changes its position to East boundary' do
          rover.execute('fb')
          expect(rover.direction).to eq('W')
          expect(rover.position).to eq(Coordinates.new(x: 100, y: 0))
        end
      end
      context 'North boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 100), 'N') }
        it 'changes its position to North boundary' do
          rover.execute('fb')
          expect(rover.direction).to eq('N')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 100))
        end
      end
      context 'South boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: -100), 'S') }
        it 'changes its position to North boundary' do
          rover.execute('fb')
          expect(rover.direction).to eq('S')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 100))
        end
      end
    end
  
    describe 'when changing map size and going beyond the limit of' do
      context 'East boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: 1000, y: 0), 'E') }
        it 'changes its position to West boundary' do
          Rover.update_map_size(x_axis_max:1000, y_axis_max:1000)
          rover.execute('f')
          expect(rover.direction).to eq('E')
          expect(rover.position).to eq(Coordinates.new(x: -999, y: 0))
        end
      end
      context 'West boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: -1000, y: 0), 'W') }
        it 'changes its position to East boundary' do
          rover.execute('f')
          expect(rover.direction).to eq('W')
          expect(rover.position).to eq(Coordinates.new(x: 999, y: 0))
        end
      end
      context 'North boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: 1000), 'N') }
        it 'changes its position to South boundary' do
          rover.execute('f')
          expect(rover.direction).to eq('N')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: -999))
        end
      end
      context 'South boundary' do
        let(:rover) { described_class.new(Coordinates.new(x: 0, y: -1000), 'S') }
        it 'changes its position to North boundary' do
          rover.execute('f')
          expect(rover.direction).to eq('S')
          expect(rover.position).to eq(Coordinates.new(x: 0, y: 999))
        end
      end
    end
  end
end
