require_relative '../rover'

RSpec.describe 'Rover' do

  describe "Setting the rover" do
    it 'has an initial point' do
      expect(Rover.new(0, 0).initial_points).to eq([0, 0])
    end

    it 'knows the direction'

    it 'errors when does not know the coordinates' do
      expect{ Rover.new().initial_points }.to raise_error
    end

    it 'errors when direction is unavailable'
    it 'errors when the direction is not one of the cardinal directions'
  end
end
