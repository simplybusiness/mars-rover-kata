require_relative '../lib/compass'

RSpec.describe Compass do
  it 'has a direction' do
    compass = Compass.new(:N)

    expect(compass.direction).to eq(:N)
  end

  it 'turns right from north to east' do
    compass = Compass.new(:N)

    expect(compass.turn_right.direction).to eq(:E)
  end

  it 'turns left from north to west' do
    compass = Compass.new(:N)

    expect(compass.turn_left.direction).to eq(:W)
  end
end
