require './lib/mars_rover'

RSpec.describe MarsRover do
  it 'knows its initial starting coordinates of x and y' do
    expect(MarsRover.new(x:200).x).to eq 200
  end

  it 'knows its compass direction'
end
