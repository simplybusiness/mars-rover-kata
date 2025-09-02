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

    it 'has a starting direction of north' do
        mars_rover = MarsRover.new(starting_position: [0, 0], starting_direction: "N")
        expect(mars_rover.direction).to eq "N"
    end

    invalid_directions = ['Y', nil, 1]
    invalid_directions.each do |invalid_direction|
        it "cannot have an invalid direction e.g. #{invalid_direction.inspect}" do
            expect {
                MarsRover.new(starting_position: [0, 0], starting_direction: invalid_direction)
            }.to raise_error(ArgumentError, "Starting direction is invalid and must be N, E, S, or W")
        end
    end
    it 'starting position is nil'





end