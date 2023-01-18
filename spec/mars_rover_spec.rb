require './lib/mars_rover'

RSpec.describe MarsRover do
  it 'knows its initial starting coordinates of x and y' do
    x_coordinate = 200
    y_coordinate = 400
    mars_rover = MarsRover.new(x: x_coordinate, y: y_coordinate)

    expect(mars_rover.coordinates).to eq [x_coordinate, y_coordinate]
  end

  it 'knows its compass direction'
end
