# Req 1: You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
require_relative "spec_helper"
require_relative "../lib/mars_rover"

describe MarsRover do
    describe "#initialise" do
        it "raise an error when initialized without a start position" do
            expect { MarsRover.new }.to raise_error(ArgumentError)
        end

        it "raise an error when initialized with non integers as start position" do
            expect { MarsRover.new(["abc", "def"], "N") }.to raise_error(ArgumentError, 'Starting point should have Integer coordinates')
        end

        it 'raises an error when only one coordinate for starting point is provided' do
            expect { MarsRover.new([0], "N") }.to raise_error(ArgumentError, 'Starting point should have [x, y] coordinate')
        end

        it "has an x coordinate and y coordinate equal to the start position passed on initialization" do
            mars_rover = MarsRover.new([0, 0], "N")
            expect(mars_rover.position).to eq([0,0])
        end

        it "raises an error when direction passed is not N,S,E,W" do 
            expect { MarsRover.new([0,0], "X") }.to raise_error(ArgumentError, 'Direction is not valid, use one of (N,S,E,W)')
        end

        xit "has a current direction equal to the direction passed on the initialization" do 
        end
    end
end
