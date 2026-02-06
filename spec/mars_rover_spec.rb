require_relative '../lib/mars_rover.rb'
RSpec.describe 'operating a mars rover' do
  it "has a starting position" do
    rover = MarsRover.new(0, 0)

    expect(rover.x_coordinate).to eq(0)
    expect(rover.y_coordinate).to eq(0)
  end
  it "has a starting direction" do
    rover = MarsRover.new(0, 0, direction: :north)

    expect(rover.direction).to eq(:north)
  end
  it "has a position on planet" do
    rover = MarsRover.new(1, 2)

    expect(rover.x_coordinate).to eq(1)
    expect(rover.y_coordinate).to eq(2)
  end
  it "has a valid direction" do
    rover = MarsRover.new(0, 0, direction: :east)

    expect(rover.direction).to eq(:east)
  end
  it "can move according to instructions" do
    rover = MarsRover.new(0, 0, direction: :north)
    expect(rover).to respond_to(:execute).with(1).argument
  end
    
  it "cannot have negative coordinates"
  it "cannot have a direction outside of north, south, east, or west"
end
