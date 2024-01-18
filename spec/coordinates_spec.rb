require_relative "../lib/coordinates"

describe Coordinates do
  describe '==' do
    it 'returns true if compared with a Coordinates object with same x and y' do
      coordinates = Coordinates.new(x: 1, y: 2)
      same_coordinates = Coordinates.new(x: 1, y: 2)
      expect(coordinates).to eq(same_coordinates)
    end

    it 'returns false if compared with a Coordinates object with same x but different y' do
      coordinates = Coordinates.new(x: 1, y: 2)
      different_y_coordinates = Coordinates.new(x: 1, y: 3)
      expect(coordinates).not_to eq(different_y_coordinates)
    end

    it 'returns false if compared with a Coordinates object with different x but same y'
    it 'returns false if compared with a Coordinates object with different x and y'
    it 'returns false if compared with anything that is not a Coordinates object'
  end
end
