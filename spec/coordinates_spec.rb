require 'rspec'
require_relative '../coordinates'

RSpec.describe Coordinates do
    describe "coordinates equality" do
        it 'two points being on the same y coordinate will not equal unless the x coordinate equals too' do
            point_x1_y0 = Coordinates.new(x: 1, y: 0)
            expect(point_x1_y0).to_not eq(point_x0_y0)
        end

        it 'two points that share the same x and y coordinates are equal' do
            origin_point = Coordinates.new(x: 0, y: 0)
            expect(point_x0_y0).to eq(origin_point)
        end

        it 'two points with equal x coordinates and different y coordinates are not equal' do
            point_x0_y1 = Coordinates.new(x:0, y:1)
            expect(point_x0_y0).to_not eq(point_x0_y1)
        end
    end

    describe "coordinates wrap around" do
        it 'the x coordinate wrap arounds' do
            point_x10_y0 = Coordinates.new(x: 10, y: 0)
            expect(point_x10_y0).to eq(point_x0_y0)
        end

        it 'the y coordinate wraps around' do
            point_x0_y10 = Coordinates.new(x: 0, y: 10)
            expect(point_x0_y10).to eq(point_x0_y0)
        end
    end

    def point_x0_y0
        Coordinates.new(x: 0, y: 0)
    end
end