require 'rspec'

RSpec.describe 'Rover Class Tests' do
  before(:context) do
  end


  context "Initializing the rover" do
    it 'has an initial position at the origin'
    it 'has an initial position away from the origin'
    it 'initially faces north'
    it 'initially faces east'
    it 'raises an exception when the direction is outside the cardinal four'
    it 'raises an exception when there is no initial position is specified'
  end
end