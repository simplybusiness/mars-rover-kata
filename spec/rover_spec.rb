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
      expect(rover.coordinates).to eq([0, 1])
      expect(rover.direction).to eq('N')
    end

    it "moves forward given starting point is 2,2"

    it "moves forward when the coordinates has negative values"

    it "moves backward"
  end
end
