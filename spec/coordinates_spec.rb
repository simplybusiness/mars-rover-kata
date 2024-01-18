require_relative "../lib/coordinates"

describe Coordinates do
  describe '==' do
    it 'returns true if compared with a Coordinates object with same x and y'
    it 'returns false if compared with a Coordinates object with same x but different y'
    it 'returns false if compared with a Coordinates object with different x but same y'
    it 'returns false if compared with a Coordinates object with different x and y'
    it 'returns false if compared with anything that is not a Coordinates object'
  end
end
