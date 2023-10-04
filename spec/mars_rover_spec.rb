require 'spec_helper'
require_relative '../mars_rover'

RSpec.describe MarsRover do
  describe '.new' do
    context 'when the mars rover is initialised' do
      subject(:mars_rover) {described_class.new(1, 2, 'E')}
      it 'returns mars rover entity' do
        expect(mars_rover).not_to be_nil
      end
      it 'contains a starting point' do
        expect(mars_rover.x).to eq(1)
        expect(mars_rover.y).to eq(2)
      end

      it 'contains a direction' do
        expect(mars_rover.direction).to eq('E')
      end
    end
  end
end
