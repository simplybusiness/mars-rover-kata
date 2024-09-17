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
      expect(Point.new(1,1)).to eq(Point.new(1,1))
    end

    specify "two co-ordinates with different x co-ordinates are unequal" do
      expect(Point.new(1,1)).not_to eq(Point.new(2,1))
    end

    specify "two co-ordinates with different y co-ordinates are unequal" do
      expect(Point.new(1,2)).not_to eq(Point.new(1,1))
    end

    specify "two co-ordinates with different types are unequal" do
      expect(Hash.new() == Point.new(1,2)).to be false
      expect(Point.new(1,2)).not_to eq(Hash.new())
    end
  end
end
