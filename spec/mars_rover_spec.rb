require './lib/mars_rover'

RSpec.describe MarsRover do
  it 'knows its initial starting coordinates of x and y' do
    expect(MarsRover.new(x:200, y:0).x).to eq 200
    expect(MarsRover.new(x:0, y:400).y).to eq 400
  end

  it 'knows its compass direction'
end
