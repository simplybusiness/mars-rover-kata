# Req 1: You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
require_relative "spec_helper"
require_relative "../lib/coordinates"

describe Coordinates do
    describe "on initialization" do
        it "raises an error when initialized with non-integers as initial position" do
            expect { Coordinates.new(x: 'abc', y: 'def')}.to raise_error BadCoordinatesError
        end

        it "assigns the intended position" do
            starting_point = Coordinates.new(x: 0, y: 1)
            expect(starting_point).to eq(Coordinates.new(x: 0, y: 1))
        end
    end
end
