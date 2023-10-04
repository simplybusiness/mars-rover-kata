require 'spec_helper'
require_relative '../mars_rover'

RSpec.describe MarsRover do
  describe '.new' do
    context 'when the mars rover is initialised' do
      it 'returns mars rover entity' do
        x = 1
        y = 2
        direction = 'E'
        mars_rover = described_class.new(x, y, direction)
        expect(mars_rover).not_to be_nil
      end
    end
  end
end
