require './rover.rb'

#Implement commands that turn the rover left/right (l,r) and move forward/backwards (f.b).
describe Rover do
  it "should turn left then go forward" do
    rover = Rover.new(0, 0, "N")
    rover.move(["l", "f"])

    expect(rover.state).to eq(OpenStruct.new(x: -1, y: 0, direction: "W"))
  end

  it "should turn right then go forward" do
    rover = Rover.new(0, 0, "N")
    rover.move(["r", "f"])

    expect(rover.state).to eq(OpenStruct.new(x: 1, y: 0, direction: "E"))
  end

  it "should turn left then go backward" do
    rover = Rover.new(0, 0, "N")
    rover.move(["l", "b"])

    expect(rover.state).to eq(OpenStruct.new(x: 1, y: 0, direction: "W"))
  end

  it "should turn right then go backward" do
    rover = Rover.new(0, 0, "N")
    rover.move(["r", "b"])

    expect(rover.state).to eq(OpenStruct.new(x: -1, y: 0, direction: "E"))
  end

  it "should turn left then go forward and backward" do
    rover = Rover.new(0, 0, "N")
    rover.move(["l", "f", "b"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "W"))
  end

  it "should turn right then go forward and backward" do
    rover = Rover.new(0, 0, "N")
    rover.move(["r", "f", "b"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "E"))
  end

  it "should turn left then forward then go right and backward" do
    rover = Rover.new(0, 0, "N")
    rover.move(["l", "f","r", "b"])

    expect(rover.state).to eq(OpenStruct.new(x: -1, y: -1, direction: "N"))
  end
end
