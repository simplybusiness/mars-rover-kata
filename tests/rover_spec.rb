require './rover.rb'

#init rover and check that it has x,y and direction
describe Rover do
  it "should have x,y and direction" do
    rover = Rover.new(1, 2, "N")

    expect(rover.x).to eq(1)
    expect(rover.y).to eq(2)
    expect(rover.direction).to eq("N")
  end
end

#inti rover and pass nil for x,y and direction
# check that it raises an error
describe Rover do
  it "should raise an error if x,y or direction is nil" do
    expect { Rover.new(nil, nil, nil) }.to raise_error(ArgumentError)
  end
end

#init rover and pass a string for x,y
# check that it raises an error
describe Rover do
  it "should raise an error if x or y is not a number" do
    expect { Rover.new("a", "b", "N") }.to raise_error(ArgumentError)
  end
end

#init rover and pass a "P" for direction
# check that it raises an error
describe Rover do
  it "should raise an error if direction is not N, S, E, or W" do
    expect { Rover.new(1, 2, "P") }.to raise_error(ArgumentError)
  end
end

#init rover and pass an array of directions
describe Rover do
  it "should take an array of directions" do
    rover = Rover.new(1, 2, "N")
    rover.move(["W", "E", "N", "S"])

    expect(rover.x).to eq(1)
    expect(rover.y).to eq(2)
    expect(rover.direction).to eq("S")
  end
end
