require_relative '../lib/coordinate.rb'

describe "Coordinate" do
    context "when initialised without parameters" do
        it 'has an x coordinate of 0 and a y coordinate of 0' do
            coordinate = Coordinate.new
            expect(coordinate.x).to eq(0)
            expect(coordinate.y).to eq(0)
        end
    end

    context "when initialised with valid parameters" do
        it 'has x and y coordinates equal to those it was initialised with' do
            coordinate = Coordinate.new(x_pos: 3, y_pos: 4)
            expect(coordinate.x).to eq(3)
            expect(coordinate.y).to eq(4)
        end
    end
end
