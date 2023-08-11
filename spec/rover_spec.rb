require_relative '../lib/rover.rb'

describe Rover do
  describe '#init' do
    it 'has an initial position of 0,0 when not given an explicit start point' do
      rover = Rover.new
      expect(rover.position[0]).to eq(0)
      expect(rover.position[1]).to eq(0)
    end

    it 'has position matching the coordinates it was initialized with' do
      rover = Rover.new(coordinates:[3,5])
      expect(rover.position[0]).to eq(3)
      expect(rover.position[1]).to eq(5)
    end

    it 'has initially faces North when not given any direction' do
      rover = Rover.new
      expect(rover.direction).to eq('N')
    end

    it 'has direction matching the one it was initialized with' do
      rover = Rover.new(direction:'S')
      expect(rover.direction).to eq('S')
    end
  end
  describe '#move' do

    xit 'does not move if it receives route'

    xit 'does not move if it does not receive a route'

    xit 'does move left when receives a single left command in the route'

    xit 'does move right when receives a single right command in the route'
    
    xit 'does move forward when receives a single forward command in the route'
    
    xit 'does move back when receives a single back command in the route'
  end
end