# Req 1: You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
require_relative "spec_helper"
require_relative "../lib/coordinates"
require_relative "../lib/mars_rover"

describe MarsRover do
    describe "#initialise" do
        let(:starting_point) { Coordinates.new(x: 0, y: 0) }

        it "raise an error when initialized without a start position" do
            expect { MarsRover.new }.to raise_error(ArgumentError)
        end

        it "has an coordinate equal to the start position passed on initialization" do
            mars_rover = MarsRover.new(starting_point, "N")
            expect(mars_rover.position).to eq(starting_point)
        end

        it "raises an error when direction passed is not N,S,E,W" do
            expect { MarsRover.new(starting_point, "X") }.to raise_error(ArgumentError, 'Direction is not valid, use one of (N,S,E,W)')
        end

        it "has a current direction equal to the direction passed on the initialization" do
            ['N', 'S', 'E', 'W'].each do |direction|
                mars_rover = MarsRover.new(starting_point, direction)
                expect(mars_rover.direction).to eq(direction)
            end
        end

        it "raises an error when starting_point is not a Coordinate" do
            expect { MarsRover.new("start", "N") }.to raise_error(ArgumentError, 'starting_point should be a Coordinate data type')
        end
    end

    describe "#consume" do
        let(:rover) {described_class.new(Coordinates.new(x: 0, y: 0), 'N')}
        it "expects an array of characters" do
            expect { rover.consume(['f', 'f', 'r']) }.not_to raise_error
        end

        it "expects a string" do
            expect { rover.consume("ffr") }.not_to raise_error
        end

        [0, 0.5, {A: 'a'}, ['f', 'X'], "random"].each do |commands|
            it "raises an error for #{commands} type" do
                expect { rover.consume(commands) }.to raise_error ArgumentError
            end
        end

        context "for commands other than f,b,l,r" do
            it "raises an error with bad array input" do
                expect { rover.consume(['f', 'l', 0]) }.to raise_error ArgumentError
            end

            it "raises an error with bad string input" do
                expect { rover.consume("fl0") }.to raise_error ArgumentError

            end

            it "raises an error for empty input" do
                expect { rover.consume(nil) }.to raise_error ArgumentError
            end

            it "raises an error for empty input array" do
                expect { rover.consume([nil]) }.to raise_error ArgumentError
            end
        end

        context "for commands moving the rover" do

        end
    end
end
