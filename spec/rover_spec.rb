require_relative "spec_helper"
require_relative "../lib/coordinates"
require_relative "../lib/rover"
require 'pry-byebug'

describe Rover do
    describe "on initialization" do
        let(:position) { Coordinates.new(x: 0, y: 0) }

        it "raises an error when no initial position is provided" do
            expect { Rover.new }.to raise_error(ArgumentError)
        end

        it "uses the initial position provided" do
            rover = Rover.new(position, "N")
            expect(rover.position).to eq(Coordinates.new(x: 0, y: 0))
        end

        it "raises an error for invalid direction -- eg. X (not N, S, W, E)" do
            expect { Rover.new(position, "X") }.to raise_error(ArgumentError, 'Direction is not valid, use one of (N,S,E,W)')
        end

        it "uses the direction provided" do
            ['N', 'S', 'E', 'W'].each do |direction|
                rover = Rover.new(position, direction)
                expect(rover.direction).to eq(direction)
            end
        end

        it "raises an error when starting position is not of type Coordinates" do
            expect { Rover.new("start", "N") }.to raise_error(ArgumentError, 'Position should be a Coordinate data type')
        end
    end

    describe "when taking commands" do
        let(:rover) {described_class.new(Coordinates.new(x: 0, y: 0), 'N')}

        it "expects an array of characters" do
            expect { rover.execute(['f', 'f', 'r']) }.not_to raise_error
        end

        it "expects a string" do
            expect { rover.execute("ffr") }.not_to raise_error
        end

        [0, 0.5, {A: 'a'}].each do |commands|
            it "raises an error for wrong input -- eg. '#{commands}'" do
                expect { rover.execute(commands) }.to raise_error ArgumentError
            end
        end

        context "for commands moving the rover" do

            # ['N','E','S','W'].each do |direction|
            #     context "when facing #{direction}" do

            #     end
            # end

            context 'when facing North' do
                let(:rover) {described_class.new(Coordinates.new(x: 0, y: 0), 'N')}

                it 'increases Y-axis value for forward' do
                    rover.execute('f')
                    expect(rover.position).to eq(Coordinates.new(x: 0, y: 1))
                end

                it 'decreases Y-axis value for backward' do
                    rover.execute('b')
                    expect(rover.position).to eq(Coordinates.new(x: 0, y: -1))
                end
            end

            context 'when facing South' do
                let(:rover) {described_class.new(Coordinates.new(x: 0, y: 0), 'S')}

                it 'decreases Y-axis value for forward' do
                    rover.execute('f')
                    expect(rover.position).to eq(Coordinates.new(x: 0, y: -1))
                end

                it 'increases Y-axis value for backward' do
                    rover.execute('b')
                    expect(rover.position).to eq(Coordinates.new(x: 0, y: 1))
                end
            end

            context 'when facing West' do
                let(:rover) {described_class.new(Coordinates.new(x: 0, y: 0), 'W')}

                it 'decreases X-axis value for forward' do
                    rover.execute('f')
                    expect(rover.position).to eq(Coordinates.new(x: -1, y: 0))
                end

                it 'increases X-axis value for backward' do
                    rover.execute('b')
                    expect(rover.position).to eq(Coordinates.new(x: 1, y: 0))
                end
            end

            context 'when facing East' do
                let(:rover) {described_class.new(Coordinates.new(x: 0, y: 0), 'E')}

                it 'increases X-axis value for forward' do
                    rover.execute('f')
                    expect(rover.position).to eq(Coordinates.new(x: 1, y: 0))
                end

                it 'decreases X-axis value for backward' do
                    rover.execute('b')
                    expect(rover.position).to eq(Coordinates.new(x: -1, y: 0))
                end
            end

            it "ends up in same position for f-b"
        end

        context "for commands other than f,b,l,r" do
            it "does nothing"
        end

    end
end
