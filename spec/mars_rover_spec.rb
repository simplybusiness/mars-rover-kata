require './lib/mars_rover'

RSpec.describe MarsRover do
  it 'knows its initial starting coordinates of x and y' do
    mars_rover = MarsRover.new(x: 200, y: 400, direction: 'S')

    expect(mars_rover.coordinates).to eq [200, 400]
  end

  it 'knows its compass direction' do
    mars_rover = MarsRover.new(x: 200, y: 400, direction: 'N')

    expect(mars_rover.direction).to eq 'N'
  end

  it 'recieves a character array of commands' do
    mars_rover = MarsRover.new(x: 200, y: 400, direction: 'N')

    result = mars_rover.commands(['w', 'w', 'a'])

    expect(result).to eq(['w', 'w', 'a'])
  end

  it 'implements commands that move the rover forward or backward' do
    mars_rover = MarsRover.new(x: 200, y: 400, direction: "N")

    mars_rover.commands(['w', 'w', 's'])
    
    expect(mars_rover.coordinates).to eq [200, 450]
  end
end
