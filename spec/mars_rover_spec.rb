require_relative "spec_helper"
require_relative "../lib/mars_rover"

describe MarsRover do
    describe "initialisation" do
        it "raise Argument error if starting point is not given upon initialisation" do
            expect { MarsRover.new }.to raise_error(ArgumentError)
        end

        it "default starting point of x = 0 and y = 0" do
            test_mars_rover = MarsRover.new(0, 0)
            expect(test_mars_rover.position).to eq([0, 0])
        end

        it "starting point of x and y given by the starting position" do
        end
    end
end
