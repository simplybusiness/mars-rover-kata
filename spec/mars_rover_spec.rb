# Req 1: You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
require_relative "spec_helper"
require_relative "../lib/coordinate"
require_relative "../lib/mars_rover"

describe MarsRover do
    describe "#initialise" do
        it "raise an error when initialized without a start position" do
            expect { MarsRover.new }.to raise_error(ArgumentError)
        end

        it "has an x coordinate and y coordinate equal to the start position passed on initialization" do
            starting_point = Coordinate.new(x: 0, y: 0)
            mars_rover = MarsRover.new(starting_point, "N")
            expect(mars_rover.position).to eq(starting_point)
        end

        it "raises an error when direction passed is not N,S,E,W" do
            expect { MarsRover.new(Coordinate.new(x: 0, y: 0), "X") }.to raise_error(ArgumentError, 'Direction is not valid, use one of (N,S,E,W)')
        end

        it "has a current direction equal to the direction passed on the initialization" do
            ['N', 'S', 'E', 'W'].each do |direction|
                mars_rover = MarsRover.new(Coordinate.new(x: 0, y: 0), direction)
                expect(mars_rover.direction).to eq(direction)
            end
        end
    end
end
