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
    it "is transitive"
  end
end