# frozen_string_literal: true

require_relative '../mars_rover'

RSpec.describe MarsRover do
  describe '.new' do
    context 'when the mars rover is initialised' do
      subject(:mars_rover) { described_class.new(x_pos: 1, y_pos: '2', cardinal_direction: 'E') }

      it 'returns mars rover entity' do
        expect(mars_rover).not_to be_nil
      end
      it 'contains a starting point' do
        expect(mars_rover.x_pos).to eq(1)
        expect(mars_rover.y_pos).to eq(2)
      end

      it 'contains a direction' do
        expect(mars_rover.cardinal_direction).to eq('E')
      end
    end

    context 'when the mars rover is initialised with invalid arguments' do
      it 'raises an error for wrong directions' do
        expect { described_class.new(x_pos: 0, y_pos: 0, cardinal_direction: 'X') }
          .to raise_error InvalidMarsRoverDirection
      end

      it 'raises an error for wrong geo locations' do
        expect { described_class.new(x_pos: 0, y_pos: 'Z', cardinal_direction: 'E') }
          .to raise_error InvalidMarsRoverGeoLocation
      end
    end
  end
end
