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

    it 'errors when direction is unavailable'

    it 'errors when the direction is not one of the cardinal directions' do
      expect{Rover.new(0, 0, 'B')}.to raise_error
    end
  end
end
