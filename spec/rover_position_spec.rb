require './rover.rb'

#Implement commands that move the rover forward/backward (f,b).
describe Rover do
  it "should move forward when facing N" do
    rover = Rover.new(0, 0, "N")
    rover.move(["f"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: 1))
    expect(rover.direction).to eq("N")
  end

  it "should move backward when facing N" do
    rover = Rover.new(0, 0, "N")
    rover.move(["b"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: -1))
    expect(rover.direction).to eq("N")
  end

  it "should move forward when facing S" do
    rover = Rover.new(0, 0, "S")
    rover.move(["f"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: -1))
    expect(rover.direction).to eq("S")
  end

  it "should move backward when facing S" do
    rover = Rover.new(0, 0, "S")
    rover.move(["b"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: 1))
    expect(rover.direction).to eq("S")
  end

  it "should move forward when facing E" do
    rover = Rover.new(0, 0, "E")
    rover.move(["f"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: 1, y: 0))
    expect(rover.direction).to eq("E")
  end

  it "should move backward when facing E" do
    rover = Rover.new(0, 0, "E")
    rover.move(["b"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: -1, y: 0))
    expect(rover.direction).to eq("E")
  end

  it "should move forward when facing W" do
    rover = Rover.new(0, 0, "W")
    rover.move(["f"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: -1, y: 0))
    expect(rover.direction).to eq("W")
  end

  it "should move backward when facing W" do
    rover = Rover.new(0, 0, "W")
    rover.move(["b"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: 1, y: 0))
    expect(rover.direction).to eq("W")

  end
end

#Implement multiple forwards and backwards commands
describe Rover do
  it "should move forward multiple times" do
    rover = Rover.new(0, 0, "N")
    rover.move(["f", "f", "f"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: 3))
    expect(rover.direction).to eq("N")
  end

  it "should move backward multiple times" do
    rover = Rover.new(0, 0, "N")
    rover.move(["b", "b", "b"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: -3))
    expect(rover.direction).to eq("N")
  end

  it "should move forward and backward multiple times" do
    rover = Rover.new(0, 0, "N")
    rover.move(["f", "b", "f", "b"])

    expect(rover.coordinates).to eq(OpenStruct.new(x: 0, y: 0))
    expect(rover.direction).to eq("N")
  end
end
