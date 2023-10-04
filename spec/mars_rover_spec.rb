# Req 1: You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
require_relative "spec_helper"
require_relative "../lib/mars_rover"

describe MarsRover do
    describe "#initialise" do
        it "raise an error when initialized without a start position" do
            expect { MarsRover.new }.to raise_error(ArgumentError)
        end

        it "raise an error when initialized with non integers as start position" do
            expect { MarsRover.new(["abc", "def"]) }.to raise_error(ArgumentError)
        end

        it 'raises an error when only one coordinate for starting point is provided'

        it "has an x coordinate and y coordinate equal to the start position passed on initialization" do
            mars_rover = MarsRover.new([0, 0])
            expect(mars_rover.position).to eq([0,0])
        end
    end
end
