require './mars_rover/starting_point'

describe 'starting point' do
  it 'by default starts at the origin' do
    starting_point = Coordinates.new

    expect(starting_point.x).to eq(0)
    expect(starting_point.y).to eq(0)
  end

  it 'can start with x and y Coordinates that have been set' do
    starting_point = Coordinates.new(x: 2, y: 4)

    expect(starting_point.x).to eq(2)
    expect(starting_point.y).to eq(4)
  end

  it 'asserts that the user input for x and y are integers' do
    expect { Coordinates.new(x: '12') }.to raise_error(ArgumentError, "Coordinate must be an integer")
    expect { Coordinates.new(y: '4') }.to raise_error(ArgumentError, "Coordinate must be an integer")
  end


  it 'has a starting point where the x and y Coordinates are the same' do
    starting_point = Coordinates.new(x: 3, y: 3)
    another_starting_point = Coordinates.new(x: 3, y: 3)

    expect(starting_point).to eq(another_starting_point)
  end

  it 'has a starting point where the x coordinate are different but y Coordinates are the same' do
    starting_point = Coordinates.new(x: 5, y: 3)
    another_starting_point = Coordinates.new(x: 1, y: 3)

    expect(starting_point).not_to eq(another_starting_point)
  end

  it 'has a starting point where the x and y Coordinates are different' do
    starting_point = Coordinates.new(x: 5, y: 6)
    another_starting_point = Coordinates.new(x: 2, y: 3)

    expect(starting_point).not_to eq(another_starting_point)
  end

  it 'is not equal to hash'
  it 'cannot be initialized without a starting point'
  it 'has a starting point anywhere on the planet'
end
