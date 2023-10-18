require_relative '../lib/coordinates'
RSpec.describe Coordinates do
  describe 'equals' do
    it 'is symmetric'
    it 'is associative'
    it 'is transitive'
    specify 'two coordinates with the same x- and y-coordinates are equal' do
      coordinate = Coordinates.new(x: 0, y: 0)
      same_coordinate = Coordinates.new(x: 0, y: 0)

      expect(coordinate).to eq(same_coordinate)
    end
    specify 'two coordinates with the same x-coordinates but different y are unequal'
    specify 'two coordinates with the same y-coordinates but equal x are unequal'
    ['(1, 1)', [1, 2], {x: 1, y: 2}, 1].each do |object_of_different_type|
      specify "coordinates are not equal to an object of a different type e.g. #{object_of_different_type}"
    end
  end
end