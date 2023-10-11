# Req 1: You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
require_relative "spec_helper"
require_relative "../lib/coordinate"

describe Coordinates do
    describe "#initialise" do
        it "raise an error when initialized with non integers as start position" do
            expect { Coordinates.new(x: 'abc', y: 'def')}.to raise_error(ArgumentError, 'Starting point should have Integer coordinates')
        end

        it 'raises an error when only one coordinate for starting point is provided' do
            expect { Coordinates.new(x: 0)  }.to raise_error(ArgumentError, 'missing keyword: :y')
        end

        it "has an x coordinate and y coordinate equal to the start position passed on initialization" do
            starting_point = Coordinates.new(x: 0, y: 1)
            expect(starting_point.x).to eq(0)
            expect(starting_point.y).to eq(1)
        end
    end
end
