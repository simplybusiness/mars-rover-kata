require_relative '../point'

RSpec.describe 'Point' do
  describe "point" do
    it "has a x co-ordinate" do
      expect(Point.new(1,0).x_coordinate).to eq(1)
    end

    it "has a y co-ordinate" do
      expect(Point.new(0,1).y_coordinate).to eq(1)
    end

    specify "two co-ordinates with the same x and y co-ordinates are the same" do
      expect(Point.new(1,1) == Point.new(1,1)).to be true
    end

    specify "two co-ordinates with different x or y co-ordinates are unequal"
  end
end
