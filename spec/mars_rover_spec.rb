require_relative "../mars_rover"

RSpec.describe 'mars rover' do
    it 'has a current position' do
        mars_rover = MarsRover.new(starting_position: [0, 0], starting_direction: "N")

        expect(mars_rover.current_position).to eq [0, 0]
    end

    it 'has a current position away from the origin' do
      mars_rover = MarsRover.new(starting_position: [0, 1], starting_direction: "N")

      expect(mars_rover.current_position).to eq [0, 1]
    end

    it 'has a direction' do
        mars_rover = MarsRover.new(starting_position: [0, 0], starting_direction: "N")
        expect(mars_rover.direction).to eq "N"
    end

    it 'has a direction other than N'
    it 'assigns a direction when an invalid direction is given'
    it 'assigns a position when an invalid position is given'
end