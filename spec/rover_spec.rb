require_relative '../rover'

RSpec.describe 'Rover' do

  describe "Setting the rover" do
    it 'has an initial point'
    it 'knows the direction'
    it 'errors when does not know the coordinates'
    it 'errors when direction is unavailable'
    it 'errors when the direction is not one of the cardinal directions'
  end
end
