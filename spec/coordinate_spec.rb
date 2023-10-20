require_relative '../lib/coordinate.rb'

describe "Coordinate" do
    context "when initialised without parameters" do
        it 'has x and y coordinates of 0' do
            coordinate = Coordinate.new
            expect(coordinate.x_position).to eq(0)
            expect(coordinate.y_position).to eq(0)
        end
    end

    context "when initialised with valid parameters" do
        it 'has x and y coordinates equal to those it was initialised with' do
            coordinate = Coordinate.new(x_pos: 3, y_pos: 4)
            expect(coordinate.x_position).to eq(3)
            expect(coordinate.y_position).to eq(4)
        end
    end

    context "when initialised with invalid parameters (not integers)" do
        it "throws an argument error with a descriptive message" do
            expect{Coordinate.new(x_pos: 3, y_pos: 'S')}.to raise_error(ArgumentError, 'coordinates must be integers')
        end
    end
end
