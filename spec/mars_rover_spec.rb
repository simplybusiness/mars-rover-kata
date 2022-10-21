require_relative '../lib/mars_rover.rb'

describe MarsRover do
  it 'has an initial starting point' do
    starting_coordinate_x = 0
    starting_coordinate_y = 0
    mars_rover = MarsRover.new(starting_coordinate_x: starting_coordinate_x, starting_coordinate_y: starting_coordinate_y)

    expect(mars_rover.starting_coordinate_x).to eq 0
    expect(mars_rover.starting_coordinate_y).to eq 0
  end
end

