require_relative '../lib/coordinates'
RSpec.describe Coordinates do
  describe 'equals' do
    it 'is symmetric' do
      coordinates = Coordinates.new(x: -1, y: -2)

      expect(coordinates).to eq(coordinates)
    end

    it 'is associative'
    it 'is transitive'
    specify 'two coordinates with the same x- and y-coordinates are equal' do
      coordinate = Coordinates.new(x: 0, y: 0)
      same_coordinate = Coordinates.new(x: 0, y: 0)

      expect(coordinate).to eq(same_coordinate)
    end

    specify 'two coordinates with the same x-coordinates but different y are unequal' do
      coordinate = Coordinates.new(x: 0, y: 2)
      coordinate_with_different_y = Coordinates.new(x: 0, y: -1)

      expect(coordinate).not_to eq(coordinate_with_different_y)
    end
    specify 'two coordinates with the same y-coordinates but different x are unequal' do
      coordinate = Coordinates.new(x: -1, y: 2)
      coordinate_with_different_x = Coordinates.new(x: 5, y: 2)

      expect(coordinate).not_to eq(coordinate_with_different_x)
    end

    ['(1, 1)', [1, 2], {x: 1, y: 2}, 1].each do |object_of_different_type|
      specify "coordinates are not equal to an object of a different type e.g. #{object_of_different_type.inspect}" do
        coordinate = Coordinates.new(x: -1, y: 10)

        expect(coordinate).not_to eq(object_of_different_type)
      end
    end
  end
end