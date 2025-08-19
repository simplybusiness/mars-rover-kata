require_relative "../mars_rover"

RSpec.describe 'mars rover' do
    it 'has a current position' do
        mars_rover = MarsRover.new
        expect(mars_rover.current_position).to eq [0, 0]
    end
    it 'has a direction'
end