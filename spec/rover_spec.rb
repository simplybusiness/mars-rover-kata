require_relative '../rover'

RSpec.describe 'Rover' do

  describe "Setting the rover" do
    it 'has an initial point' do
      expect(Rover.new(0, 0).coordinates).to eq([0, 0])
    end

    it 'knows the direction' do
      expect(Rover.new(0, 0).direction).to eq('N')
    end

    it 'faces any direction' do
      expect(Rover.new(0, 0, 'S').direction).to eq('S')
    end

    it 'errors when does not know the coordinates' do
      expect{ Rover.new().coordinates }.to raise_error
    end

    it 'errors when direction is unavailable' do
      expect{Rover.new(0, 0, nil)}.to raise_error
    end

    it 'errors when the direction is not one of the cardinal directions' do
      expect{Rover.new(0, 0, 'B')}.to raise_error
    end
  end

  describe "rover receives the commands" do
    it "receives an array of commands" do
      rover = Rover.new(0, 0)
      expect(rover).to respond_to(:commands).with(1)
    end

    it "moves forward given starting from initial point and the direction set is North" do
      rover = Rover.new(0, 0, 'N')
      expect(rover.commands(['f'])).to eq(['N', 0, 1])
      expect(rover).to be_located_at([0, 1]).and be_directed('N')
    end

    it "moves forward given starting point is 2,2 and the direction is North" do
      rover = Rover.new(2, 2, 'N')
      expect(rover.commands(['f'])).to eq(['N', 2, 3])
      expect_mars_rover(expected_location: [2, 3], expected_direction: 'N', rover: rover)
    end

    it "moves forward given starting point is 2,2 and the direction set is South"

    it 'moves forward given starting from initial point and the direction set is East' do
      rover = Rover.new(0, 0, 'E')
      expect(rover.commands(['f'])).to eq(['E', 1, 0])
      expect_mars_rover(expected_location: [1, 0], expected_direction: 'E', rover: rover)
    end

    it 'moves forward given starting from initial point and the direction set is West'

    it "moves forward when starting from the point -1,0 and the direction is North"

    it "moves backward given starting from initial point and the direction set is North"

    it "moves backward given starting from initial point and the direction set is South"

    it "moves backward given starting from initial point and the direction set is East"

    it "moves backward given starting point is 2,2 and the direction set is West"

    it "moves backward given starting point is 2,2 and the direction set is East"

    it "moves backward when starting from the point -1,0 and the direction is North"
  end

  RSpec::Matchers.define :be_located_at do |expected_location|
    match do |mars_rover|
      mars_rover.coordinates == expected_location
    end
  end

  RSpec::Matchers.define :be_directed do |expected_direction|
    match do |mars_rover|
      mars_rover.direction == expected_direction
    end
  end

  def expect_mars_rover(expected_location:, expected_direction:, rover:)
    expect(rover.coordinates).to eq(expected_location)
    expect(rover.direction).to eq(expected_direction)
  end
end
