require 'ostruct'
require_relative '../mars_rover'

describe 'Mars rover' do

  let(:mars_rover) { MarsRover.new }



  it 'has a starting point' do
    expect(mars_rover.starting_point).to eq(OpenStruct.new(x: 0, y: 0))
  end

  it 'has any starting point' do
    mars_rover = MarsRover.new(starting_point: OpenStruct.new(x: 2, y: 5))
    expect(mars_rover.starting_point).to eq(OpenStruct.new(x: 2, y: 5))
  end

  it 'faces a particular direction (N, E, S, W)' do
    expect(mars_rover.direction).to eq('N')
  end

  it 'faces any particular direction' do
    mars_rover = MarsRover.new(direction: 'S')
    expect(mars_rover.direction).to eq('S')
  end
  it 'receives commands from earth' do
    expect(mars_rover).to respond_to(:execute)
  end



  context "moves forward" do
    [OpenStruct.new(direction: "N", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:2, y: 6)),
     OpenStruct.new(direction: "S", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:2, y: 4)),
     OpenStruct.new(direction: "E", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:1, y: 5)),
     OpenStruct.new(direction: "W", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:3, y: 5))
    ].each do |hash|
      it "moves when facing (#{hash.direction}) " do
        mars_rover = MarsRover.new(direction: hash.direction, starting_point: hash.start)
        mars_rover.execute(commands: ['f'])
        expect(mars_rover.starting_point).to eq(hash.end)
      end
    end
  end

  context "moves backward" do
    [OpenStruct.new(direction: "N", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:2, y: 4)),
     OpenStruct.new(direction: "S", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:2, y: 6)),
     OpenStruct.new(direction: "E", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:3, y: 5)),
     OpenStruct.new(direction: "W", start: OpenStruct.new(x:2, y: 5), end: OpenStruct.new(x:1, y: 5))
    ].each do |hash|
      it "moves when facing (#{hash.direction}) " do
        mars_rover = MarsRover.new(direction: hash.direction, starting_point: hash.start)
        mars_rover.execute(commands: ['b'])
        expect(mars_rover.starting_point).to eq(hash.end)
      end
    end
  end

end
