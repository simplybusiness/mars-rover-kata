require_relative "../coordinates"

RSpec.describe 'coordinates' do
  describe 'equals' do
    it "is reflexive" do
      coordinate = Coordinates.new(0, 0)
      expect(coordinate).to eq(coordinate)
    end

    it "is symmetric" do
      c1 = Coordinates.new(0, 0)
      c2 = Coordinates.new(0, 0)
      expect(c1).to eq(c2)
    end

    it "is transitive" do
      c1 = Coordinates.new(0, 0)
      c2 = Coordinates.new(0, 0)
      c3 = Coordinates.new(0, 0)
      expect(c1).to eq(c2)
      expect(c2).to eq(c3)
      expect(c1).to eq(c3)
    end

    it "tests if coordinates with different x and y are not equal" do
      c1 = Coordinates.new(0, 0)
      c2 = Coordinates.new(1, 1)
      expect(c1).not_to(eq(c2), "expected #{c1.inspect} not to equal #{c2.inspect}")
    end
  end
end