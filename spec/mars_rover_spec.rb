# Req 1: You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
require_relative "spec_helper"
require_relative "../lib/mars_rover"

describe MarsRover do
    describe "#initialise" do
        it "raise an error when initialized without a start position" do
            expect { MarsRover.new }.to raise_error(ArgumentError)
        end

        xit "has an x coordinate and y coordinate equal to the start position passed on initialization" do
        end
    end
end
