require './rover.rb'

#Implement wrapping at edges. But be careful, planets are spheres. Connect the x edge to the other x edge, and the same for y.
describe Rover do
  # move 11 spaces forward expect to be at 0, 0
  it "should wrap around the Y axis" do
    rover = Rover.new(0, 0, "N")
    rover.move(["f"] * 11)

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: -10, direction: "N"))
    expect(rover.direction).to eq("N")
  end

  it "should wrap around the X axis" do
    rover = Rover.new(0, 0, "E")
    rover.move(["f"] * 11)

    expect(rover.state).to eq(OpenStruct.new(x: -10, y: 0, direction: "E"))
    expect(rover.direction).to eq("E")
  end

  it "should wrap around both axis" do
    rover = Rover.new(0, 0, "N")
    rover.move(["f"] * 11)
    rover.move(["r"])
    rover.move(["f"] * 11)

    expect(rover.state).to eq(OpenStruct.new(x: -10, y: -10, direction: "E"))
    expect(rover.direction).to eq("E")
  end

  it "should not wrap when at the edge (10,10) and rotates" do
    rover = Rover.new(10, 10, "N")
    rover.move(["l"])

    expect(rover.state).to eq(OpenStruct.new(x: 10, y: 10, direction: "W"))
  end

  #can you check a method isnt called?

end
