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

  it 'asserts that the user input for x and y are integers' do
    expect { StartingPoint.new(x: '12') }.to raise_error(ArgumentError, "Coordinate must be an integer")
    expect { StartingPoint.new(y: '4') }.to raise_error(ArgumentError, "Coordinate must be an integer")
  end


  it 'has a starting point where the x and y coordinates are the same' do
    starting_point = StartingPoint.new(x: 3, y: 3)
    another_starting_point = StartingPoint.new(x: 3, y: 3)

    expect(starting_point).to eq(another_starting_point)
  end

  it 'has a starting point where the x coordinate are different but y coordinates are the same' do
    starting_point = StartingPoint.new(x: 5, y: 3)
    another_starting_point = StartingPoint.new(x: 1, y: 3)

    expect(starting_point).not_to eq(another_starting_point)
  end

  it 'has a starting point where the y coordinate are different but x coordinates are the same' do
    starting_point = StartingPoint.new(x: 2, y: 7)
    another_starting_point = StartingPoint.new(x: 2, y: 5)

    expect(starting_point.y).not_to eq(another_starting_point.y)
    expect(starting_point.x).to eq(another_starting_point.x)
  end

  it 'is not equal to hash'
  it 'cannot be initialized without a starting point'
  it 'has a starting point anywhere on the planet'
end
