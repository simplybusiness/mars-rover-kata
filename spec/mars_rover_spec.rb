require_relative "spec_helper"
require_relative "../lib/mars_rover"

describe MarsRover do
    describe "initialisation" do
        it "raise Argument error if starting point is not given upon initialisation" do
            expect { MarsRover.new }.to raise_error(ArgumentError)
        end

        it "starting point is correct given x and y" do
            test_mars_rover_1 = MarsRover.new(0, 0, "N")
            expect(test_mars_rover_1.position).to eq([0, 0])

            test_mars_rover_2 = MarsRover.new(3, 5, "N")
            expect(test_mars_rover_2.position).to eq([3, 5])
        end

        it "starting point coordinates should be integer" do
            expect { MarsRover.new("ab", 0.6, "N") }.to raise_error(ArgumentError)
        end

        it "starting point coordinates should not be negative" do
            expect { MarsRover.new(-1, -1, "N") }.to raise_error(ArgumentError)
        end

        it "directions should be provided" do
            expect { MarsRover.new(0, 0) }.to raise_error(ArgumentError)
        end

        it "directions should be either N, S, W, E" do
            expect { MarsRover.new(0, 0, "A") }.to raise_error(ArgumentError)

            test_mars_rover = MarsRover.new(3, 5, "N")
            expect(test_mars_rover.direction).to eq("N")
        end
    end
end
