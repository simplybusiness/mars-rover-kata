require_relative '../lib/coordinate.rb'

describe Coordinate do
    describe '#init' do
        it 'has an x coordinate of 0 and a y coordinate of 0 when initialised without any parameters' do
            coordinate = Coordinate.new
            expect(coordinate.xpos).to eq(0)
            expect(coordinate.ypos).to eq(0)
        end

        it 'has an x coordinate and a y coordinate the same as that it was initialised with' do
            coordinate = Coordinate.new(3,4)
            expect(coordinate.xpos).to eq(3)
            expect(coordinate.ypos).to eq(4)
        end
    end
end