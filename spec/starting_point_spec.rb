require './mars_rover/starting_point'

describe 'starting point' do
  it 'by default starts at the origin' do
    starting_point = StartingPoint.new

    expect(starting_point.x).to eq(0)
    expect(starting_point.y).to eq(0)
  end

  it 'can start with x and y coordinates that have been set' do
    starting_point = StartingPoint.new(x: 2, y: 4)

    expect(starting_point.x).to eq(2)
    expect(starting_point.y).to eq(4)
  end

  it 'validate the x and y coordinate' do
    expect { StartingPoint.new(x: '12') }.to raise_error(ArgumentError, "Coordinate must be an integer")
  end


  it 'has a starting point where the x and y coordinates are the same'
  it 'has a starting point where the x coordinate are different but y coordinates are the same'
  it 'has a starting point where the y coordinate are different but x coordinates are the same'
  it 'is not equal to hash'
  it 'cannot be initialized without a starting point'
  it 'has a starting point anywhere on the planet'
end
