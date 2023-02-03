RSpec.describe Rover do
  subject(:rover) { described_class.new(x: 0, y: 0) }

  it 'has a starting point (x,y)' do
    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
  end
end
