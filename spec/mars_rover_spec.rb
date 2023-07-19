require 'ostruct'
describe 'Mars rover' do
  class MarsRover

  end
  it 'has a starting point' do
    pending('Homework')

    mars_rover = MarsRover.new
    expect(mars_rover.starting_point).to eq(OpenStruct.new(x: 0, y: 0))
  end

  it 'faces a particular direction (N, E, S, W)' do
    pending('Homework')

    expect(mars_rover.direction).to eq('N')
  end
end