require 'ostruct'
require_relative '../mars_rover'

describe 'Mars rover' do


  it 'has a starting point' do
    mars_rover = MarsRover.new
    expect(mars_rover.starting_point).to eq(OpenStruct.new(x: 0, y: 0))
  end

  it 'has any starting point' do
    mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 5))
    expect(mars_rover.starting_point).to eq(OpenStruct.new(x: 2, y: 5))
  end

  it 'faces a particular direction (N, E, S, W)' do
    mars_rover = MarsRover.new
    expect(mars_rover.direction).to eq('N')
  end

  it 'faces any particular direction' do
    mars_rover = MarsRover.new(direction: 'S')
    expect(mars_rover.direction).to eq('S')
  end
  it 'receives commands from earth' do
    mars_rover = MarsRover.new
    expect(mars_rover).to respond_to(:execute)
  end

  expectations = {
    "b" => {
      "expectations" => [OpenStruct.new(direction: "N", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:2, y: 4)),
                         OpenStruct.new(direction: "S", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:2, y: 6)),
                         OpenStruct.new(direction: "E", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:3, y: 5)),
                         OpenStruct.new(direction: "W", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:1, y: 5))
      ],
      "description" => "backwards"
    },
    "f" => {
      "expectations" => [OpenStruct.new(direction: "N", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:2, y: 6)),
                         OpenStruct.new(direction: "S", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:2, y: 4)),
                         OpenStruct.new(direction: "E", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:1, y: 5)),
                         OpenStruct.new(direction: "W", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:3, y: 5))
      ],
      "description" => "forward"
    }
  }

  context "Executing the command" do
    expectations.each do |key, obj|

      context "to go #{obj['description']}" do
        obj["expectations"].each do |hash|
          it "when facing (#{hash.direction}) " do
            mars_rover = MarsRover.new(direction: hash.direction, starting_point: hash.start)
            mars_rover.execute(commands: [key])
            expect(mars_rover.starting_point).to eq(hash.end)
          end
        end
      end
    end
  end

  it "moves forward twice" do
    mars_rover = MarsRover.new(direction: "N", starting_point: OpenStruct.new(x:0, y: 0))
    mars_rover.execute(commands: ['f','f'])

    expect(mars_rover.starting_point).to eq(OpenStruct.new(x:0, y: 2))
  end

  it "moves forward then backwards" do
    mars_rover = MarsRover.new(direction: "N", starting_point: OpenStruct.new(x:0, y: 0))
    mars_rover.execute(commands: ['f','b'])

    expect(mars_rover.starting_point).to eq(OpenStruct.new(x:0, y: 0))
  end

  it "turns left when facing north" do
    mars_rover = MarsRover.new(direction: "N", starting_point: OpenStruct.new(x:0, y: 0))
    mars_rover.execute(commands: ['l'])

    expect(mars_rover.direction).to eq("W")
    expect(mars_rover.starting_point).to eq(OpenStruct.new(x:0, y: 0))
  end

  it "turns left when facing east" do
    mars_rover = MarsRover.new(direction: "E", starting_point: OpenStruct.new(x:0, y: 0))
    mars_rover.execute(commands: ['l'])
    expect(mars_rover.direction).to eq("N")
  end

  it "turns left when facing south" do
    mars_rover = MarsRover.new(direction: "S", starting_point: OpenStruct.new(x:0, y: 0))
    mars_rover.execute(commands: ['l'])
    expect(mars_rover.direction).to eq("E")
  end

  it "turns left when facing west" do
    mars_rover = MarsRover.new(direction: "W", starting_point: OpenStruct.new(x:0, y: 0))
    mars_rover.execute(commands: ['l'])
    expect(mars_rover.direction).to eq("S")
  end

  it "turns left twice when facing north" do
    mars_rover = MarsRover.new(direction: "N", starting_point: OpenStruct.new(x:0, y: 0))
    mars_rover.execute(commands: ['l', 'l'])
    expect(mars_rover.direction).to eq("S")
  end

  it "turns right when facing north" do
    mars_rover = MarsRover.new(direction: "N", starting_point: OpenStruct.new(x:0, y: 0))
    mars_rover.execute(commands: ['r'])
    expect(mars_rover.direction).to eq("E")
  end

  it "turns right when facing east" do
    mars_rover = MarsRover.new(direction: "E", starting_point: OpenStruct.new(x:0, y: 0))
    mars_rover.execute(commands: ['r'])
    expect(mars_rover.direction).to eq('S')
  end

  it "turns right when facing south" do
    mars_rover = MarsRover.new(direction: "S", starting_point: OpenStruct.new(x:0, y:0))
    mars_rover.execute(commands: ['r'])
    expect(mars_rover.direction).to eq("W")
  end

  it "turns right when facing west" do
    mars_rover = MarsRover.new(direction: "W", starting_point: OpenStruct.new(x:0, y:0))
    mars_rover.execute(commands: ['r'])
    expect(mars_rover.direction).to eq("N")
  end
end
