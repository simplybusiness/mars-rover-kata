require 'coordinate'

RSpec.describe Coordinate do
  it "has a x coordinate" do
    coord = Coordinate.new(1,1)

    expect(coord.x).to eq(1)
  end

  it "has a y coordinate" do
    coord = Coordinate.new(1,1)

    expect(coord.y).to eq(1)
  end

  it "is able to determine if two coordinates are equal to the current object" do
    coord = Coordinate.new(1,1)
    coord2 = Coordinate.new(1,1)

    expect(coord).to eq(coord2)
  end

  it "two coord objects with different x values are not equal to each other" do
    coord = Coordinate.new(2,1)
    coord2 = Coordinate.new(1,1)

    expect(coord).not_to eq(coord2)
  end

  it "two coord objects with different y values are not equal to each other" do
    coord = Coordinate.new(2,13)
    coord2 = Coordinate.new(1,1)

    expect(coord).not_to eq(coord2)
  end

  it "is able to determine if two coordinates are unequal to the current object"
  it "has an method to return both the coordinates as an array of integers, keyed by position"
  it "can add to the x coordinate"
  it "can add to the y coordinate"
  it "can subtract from the x coordinate"
  it "can subtract from the y coordinate"
end