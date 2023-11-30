require_relative "spec_helper"
require_relative "../lib/mars_rover"

describe MarsRover do
    describe "initialisation" do
        it "raise Argument error if starting point is not given upon initialisation" do
            expect { MarsRover.new }.to raise_error(ArgumentError)
        end

        it "starting point is correct given coordinates" do
            test_mars_rover_1 = MarsRover.new("N", [5, 6])
            expect(test_mars_rover_1.coordinates).to eq([5, 6])

            test_mars_rover_2 = MarsRover.new( "N", [3, 5])
            expect(test_mars_rover_2.coordinates).to eq([3, 5])
        end

        it "starting point coordinates should be array of integers" do
            expect { MarsRover.new("N", 3) }.to raise_error(ArgumentError)
            expect { MarsRover.new("N", ["a", 5]) }.to raise_error(ArgumentError)
            expect { MarsRover.new("N", [5, "c"]) }.to raise_error(ArgumentError)
            expect { MarsRover.new("N", ["a", "c"]) }.to raise_error(ArgumentError)
        end

        it "starting point coordinates should not be negative" do
            expect { MarsRover.new("N", [-6, -5]) }.to raise_error(ArgumentError)
        end

        it "directions should be provided" do
            expect { MarsRover.new([5,7]) }.to raise_error(ArgumentError)
        end

        it "directions should be either N, S, W, E" do
            expect { MarsRover.new("A", [9, 0]) }.to raise_error(ArgumentError)

            test_mars_rover = MarsRover.new("N", [8, 9])
            expect(test_mars_rover.direction).to eq("N")
        end
    end

    describe 'receiving commands from earth' do
      it 'moves forwards when facing north' do
        mars_rover = MarsRover.new('N')

        expect(mars_rover).to respond_to(:execute).with(1)
      end
    end

end
