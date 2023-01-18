require "rover"

RSpec.describe Rover do
  describe '#initialize' do
    it "receives a starting point and direction" do
      rover = Rover.new(x: 10, y: 20, direction: "N")
      expect(rover.x).to eq 10
      expect(rover.y).to eq 20
      expect(rover.direction).to eq "N"
    end
  end
  describe "#move" do
    it "moves the rover forward when facing north" do
      rover = Rover.new(x: 10, y: 20, direction: "N")
      rover.move('f')
      expect(rover.x).to eq 10
      expect(rover.y).to eq 21
      expect(rover.direction).to eq "N"
    end
    it "moves the rover forward when facing south" do
      rover = Rover.new(x: 10, y: 20, direction: "S")
      rover.move('f')
      expect(rover.x).to eq 10
      expect(rover.y).to eq 19
      expect(rover.direction).to eq "S"
    end
    it "moves the rover forward when facing east" do
      rover = Rover.new(x: 10, y: 20, direction: "E")
      rover.move('f')
      expect(rover.x).to eq 11
      expect(rover.y).to eq 20
      expect(rover.direction).to eq "E"
    end
    it "moves the rover forward when facing west" do
      rover = Rover.new(x: 10, y: 20, direction: "W")
      rover.move('f')
      expect(rover.x).to eq 9
      expect(rover.y).to eq 20
      expect(rover.direction).to eq "W"
    end
    it "moves the rover backward when facing north" do
      rover = Rover.new(x: 10, y: 20, direction: "N")
      rover.move('b')
      expect(rover.x).to eq 10
      expect(rover.y).to eq 19
      expect(rover.direction).to eq "N"
    end
  end
end