require_relative '../lib/compass'

RSpec.describe Compass do
  it 'has a direction' do
    compass = Compass.new(:N)

    expect(compass.direction).to eq(:N)
  end
end
