require_relative "../coordinates"

RSpec.describe 'coordinates' do
  describe 'equals' do
    it "is reflexive" do
      coordinate = Coordinates.new(0, 0)
      expect(coordinate).to eq(coordinate)
    end

    it "is symmetric"
    it "is transitive"
  end
end