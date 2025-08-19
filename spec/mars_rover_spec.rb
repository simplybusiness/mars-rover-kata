RSpec.describe 'mars rover' do
    class MarsRover
        def current_position
            [0, 0]
        end
    end
    it 'has a current position' do
        mars_rover = MarsRover.new
        expect(mars_rover.current_position).to eq [0, 0]
    end
    it 'has a direction'
end