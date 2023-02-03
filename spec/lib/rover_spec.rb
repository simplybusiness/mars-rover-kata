RSpec.describe Rover do
  subject(:rover) { described_class.new(x: 0, y: 0, direction: 'N') }

  context "initialization" do
    it 'has a starting point (x,y)' do
      expect(rover.x).to eq(0)
      expect(rover.y).to eq(0)
    end

    it 'has a starting the direction (N,S,E,W) it is facing' do
      expect(rover.direction).to eq('N')
    end
  end

  it 'receives an array of commands' do
    commands = ['f', 'b', 'l', 'r']

    expect { rover.move(commands) }.to_not raise_error
  end

  context 'moving forward' do
    it 'facing north adds to Y' do
      rover = described_class.new(x: 0, y: 0, direction: 'N')
      rover.move(['f'])
      expect(rover.y).to eq(1)
    end

    it 'facing south subtracts to Y' do
      rover = described_class.new(x: 0, y: 0, direction: 'S')
      rover.move(['f'])
      expect(rover.y).to eq(-1)
    end

    it 'facing east adds to X'
    it 'facing west subtracts to X'
  end
end
