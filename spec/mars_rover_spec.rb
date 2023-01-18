require './lib/mars_rover'

RSpec.describe MarsRover do
  it 'knows its initial starting coordinates of x and y' do
    mars_rover = MarsRover.new(x:200, y:400)

    expect(mars_rover.x).to eq 200
    expect(mars_rover.y).to eq 400
  end

  it 'knows its compass direction'
end
