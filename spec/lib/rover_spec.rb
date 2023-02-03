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
end
