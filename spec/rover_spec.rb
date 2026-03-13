require_relative '../lib/rover'

RSpec.describe Rover do
  it 'has a starting position and direction' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end
end
