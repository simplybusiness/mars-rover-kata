require 'coordinate'

RSpec.describe Coordinate do
  it "has a x coordinate" do
    coord = Coordinate.new(1,1)

    expect(coord.x).to eq(1)
  end
  it "has a y coordinate"
  it "is able to determine if two coordinates are equal to the current object"
  it "is able to determine if two coordinates are unequal to the current object"
  it "has an method to return both the coordinates as an array of integers, keyed by position"
  it "can add to the x coordinate"
  it "can add to the y coordinate"
  it "can subtract from the x coordinate"
  it "can subtract from the y coordinate"
end