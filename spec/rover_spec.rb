require 'rspec'

RSpec.describe 'Rover Class Tests' do
  before(:context) do
  end


  context "Initializing the rover" do
    it 'has an initial position at the origin' do
      class MarsRover
        def initialize(x, y)

        end

        def position(x, y)
          return x, y
        end
      end
      rover = MarsRover.new(0, 0)
      expect(rover.position(0, 0)).to eq [0,0]
    end

    it 'has an initial position away from the origin'
    it 'initially faces north'
    it 'initially faces east'
    it 'raises an exception when the direction is outside the cardinal four'
    it 'raises an exception when there is no initial position is specified'
  end
end