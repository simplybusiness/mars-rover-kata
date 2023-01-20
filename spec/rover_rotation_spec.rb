require './rover.rb'

#Implement commands that turn the rover left/right (l,r).
describe Rover do
  it "should turn left when facing N" do
    rover = Rover.new(0, 0, "N")
    rover.move(["l"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "W"))
  end

  it "should turn right when facing N" do
    rover = Rover.new(0, 0, "N")
    rover.move(["r"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "E"))
  end

  it "should turn left when facing S" do
    rover = Rover.new(0, 0, "S")
    rover.move(["l"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "E"))
  end

  it "should turn right when facing S" do
    rover = Rover.new(0, 0, "S")
    rover.move(["r"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "W"))
  end

  it "should turn left when facing E" do
    rover = Rover.new(0, 0, "E")
    rover.move(["l"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "N"))
  end

  it "should turn right when facing E" do
    rover = Rover.new(0, 0, "E")
    rover.move(["r"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "S"))
  end

  it "should turn left when facing W" do
    rover = Rover.new(0, 0, "W")
    rover.move(["l"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "S"))
  end

  it "should turn right when facing W" do
    rover = Rover.new(0, 0, "W")
    rover.move(["r"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "N"))
  end

  it "should turn left multiple times" do
    rover = Rover.new(0, 0, "N")
    rover.move(["l", "l", "l"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "E"))
  end

  it "should turn right multiple times" do
    rover = Rover.new(0, 0, "N")
    rover.move(["r", "r", "r"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "W"))
  end

  it "should turn left and right multiple times" do
    rover = Rover.new(0, 0, "N")
    rover.move(["l", "r", "l", "r"])

    expect(rover.state).to eq(OpenStruct.new(x: 0, y: 0, direction: "N"))
  end
end
