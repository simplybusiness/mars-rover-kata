require_relative "../mars_rover"
require_relative "../coordinates"
require 'rspec/expectations'

RSpec.describe 'mars rover' do
    it 'has a current position' do
        mars_rover = MarsRover.new(starting_position: Coordinates.new(0, 0), starting_direction: "N")
        expect(mars_rover).to be_located_at(Coordinates.new(0, 0))
    end

    it 'has a current position away from the origin' do
      mars_rover = MarsRover.new(starting_position: Coordinates.new(0, 1), starting_direction: "N")
      expect(mars_rover).to  be_located_at(Coordinates.new(0, 1))
    end

    it 'has a starting direction of north' do
        mars_rover = MarsRover.new(starting_position: Coordinates.new(0, 0), starting_direction: "N")
        expect(mars_rover).to have_direction("N")
    end

    invalid_directions = ['Y', nil, 1]
    invalid_directions.each do |invalid_direction|
        it "cannot have an invalid direction e.g. #{invalid_direction.inspect}" do
            expect {
                MarsRover.new(starting_position: Coordinates.new(0, 0), starting_direction: invalid_direction)
            }.to raise_error(ArgumentError, "Starting direction is invalid and must be N, E, S, or W")
        end
    end

    invalid_starting_positions = [nil, [0, 0], "0, 0"]
    invalid_starting_positions.each do |invalid_starting_position|
        it "cannot have invalid starting position e.g. #{invalid_starting_position}" do
            expect {
            MarsRover.new(starting_position: invalid_starting_position, starting_direction: "N")
            }.to raise_error(ArgumentError, "Starting position is invalid and must be valid coordinates")
        end
    end

    it "receives an array of commands" do
        mars_rover = MarsRover.new(starting_position: Coordinates.new(0, 0), starting_direction: "N")
        expect(mars_rover).to respond_to(:execute).with(1)
    end

    it "moves forwards and is facing north" do
        mars_rover = MarsRover.new(starting_position: Coordinates.new(0, 0), starting_direction: "N")
        mars_rover.execute(["f"])
        expect(mars_rover).to be_located_at(Coordinates.new(0, 1))
    end

    it "moves forwards, facing north, and starts at position (0, 1)" do
        mars_rover = MarsRover.new(starting_position: Coordinates.new(0, 1), starting_direction: "N")
        mars_rover.execute(["f"])
        expect(mars_rover).to be_located_at(Coordinates.new(0, 2))
    end

    it "moves forwards and starts at position (1, 0)" do
        mars_rover = MarsRover.new(starting_position: Coordinates.new(1, 0), starting_direction: "N")
        mars_rover.execute(["f"])
        expect(mars_rover).to be_located_at(Coordinates.new(1, 1))
    end

    it "moves backwards and is facing north" do
        mars_rover = MarsRover.new(starting_position: Coordinates.new(0, 0), starting_direction: "N")
        mars_rover.execute(["b"])
        expect(mars_rover).to be_located_at(Coordinates.new(0, -1))
    end

    it "moves forwards and is facing east"

    it "moves backwards and is facing east"

    it "moves forwards and is facing south"

    it "moves backwards and is facing south"

    it "moves forwards and is facing west"

    it "moves backwards and is facing west"

    RSpec::Matchers.define :be_located_at do |expected_coordinates|
        match do |mars_rover|
            mars_rover.current_position == expected_coordinates
        end
    end

    RSpec::Matchers.define :have_direction do |expected_direction|
        match do |mars_rover|
            mars_rover.current_direction == expected_direction
        end
    end

end