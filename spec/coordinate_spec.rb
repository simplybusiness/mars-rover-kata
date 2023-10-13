require_relative '../lib/coordinate.rb'

describe Coordinate do
    describe '#init' do
        it 'has an x coordinate of 0 and a y coordinate of 0 when initialised without any parameters' do
            coordinate = Coordinate.new(x_pos: 0, y_pos: 0)
            expect(coordinate.x).to eq(0)
            expect(coordinate.y).to eq(0)
        end

        it 'has an x coordinate and a y coordinate the same as that it was initialised with' do
            coordinate = Coordinate.new(x_pos: 3, y_pos: 4)
            expect(coordinate.x).to eq(3)
            expect(coordinate.y).to eq(4)
        end
    end
end