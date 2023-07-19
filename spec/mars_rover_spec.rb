require 'ostruct'
describe 'Mars rover' do
  it 'has a starting point' do
    pending('Homework')

    mars_rover = MarsRover.new
    expect(mars_rover.starting_point).to eq(OpenStruct.new(x: 0, y: 0))
  end

  it 'faces a particular direction (N, E, S, W)'
end