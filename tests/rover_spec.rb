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
    expect(rover.direction).to eq("N")
  end
end

#init rover and pass string of directions
# check that it raises an error
describe Rover do
  it "should raise an error if directions is not an array" do
    rover = Rover.new(1, 2, "N")
    expect { rover.move("WEN") }.to raise_error(ArgumentError)
  end
end

#Implement commands that move the rover forward/backward (f,b).
describe Rover do
  it "should move forward when facing N" do
    rover = Rover.new(0, 0, "N")
    rover.move(["f"])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(1)
    expect(rover.direction).to eq("N")
  end

  it "should move backward when facing N" do
    rover = Rover.new(0, 0, "N")
    rover.move(["b"])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(-1)
    expect(rover.direction).to eq("N")
  end

  it "should move forward when facing S" do
    rover = Rover.new(0, 0, "S")
    rover.move(["f"])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(-1)
    expect(rover.direction).to eq("S")
  end

  it "should move backward when facing S" do
    rover = Rover.new(0, 0, "S")
    rover.move(["b"])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(1)
    expect(rover.direction).to eq("S")
  end

  it "should move forward when facing E" do
    rover = Rover.new(0, 0, "E")
    rover.move(["f"])

    expect(rover.x).to eq(1)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq("E")
  end

  it "should move backward when facing E" do
    rover = Rover.new(0, 0, "E")
    rover.move(["b"])

    expect(rover.x).to eq(-1)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq("E")
  end

  it "should move forward when facing W" do
    rover = Rover.new(0, 0, "W")
    rover.move(["f"])

    expect(rover.x).to eq(-1)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq("W")
  end

  it "should move backward when facing W" do
    rover = Rover.new(0, 0, "W")
    rover.move(["b"])

    expect(rover.x).to eq(1)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq("W")

  end
end

#Implement multiple forwards and backwards commands
describe Rover do
  it "should move forward multiple times" do
    rover = Rover.new(0, 0, "N")
    rover.move(["f", "f", "f"])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(3)
    expect(rover.direction).to eq("N")
  end

  it "should move backward multiple times" do
    rover = Rover.new(0, 0, "N")
    rover.move(["b", "b", "b"])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(-3)
    expect(rover.direction).to eq("N")
  end

  it "should move forward and backward multiple times" do
    rover = Rover.new(0, 0, "N")
    rover.move(["f", "b", "f", "b"])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq("N")
  end
end

#Implement commands that turn the rover left/right (l,r).
describe Rover do
  it "should turn left when facing N" do
    rover = Rover.new(0, 0, "N")
    rover.move(["l"])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq("W")
  end

  it "should turn right when facing N"

  it "should turn left when facing S"

  it "should turn right when facing S"

  it "should turn left when facing E"

  it "should turn right when facing E"

  it "should turn left when facing W"

  it "should turn right when facing W"

  it "should turn left multiple times"

  it "should turn right multiple times"

  it "should turn left and right multiple times"

  it "should turn left then go forward"

  it "should turn right then go forward"

  it "should turn left then go backward"

  it "should turn right then go backward"

  it "should turn left then go forward and backward"

  it "should turn right then go forward and backward"

  it "should turn left then right then go forward and backward"
end
