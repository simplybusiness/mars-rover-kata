require './mars_rover/starting_point'

describe 'starting point' do
  it 'by default starts at the origin' do
    starting_point = coordinates

    expect(starting_point.x).to eq(0)
    expect(starting_point.y).to eq(0)
  end

  it 'can start with x and y coordinates that have been set' do
    starting_point = coordinates(x: 2, y: 4)

    expect(starting_point.x).to eq(2)
    expect(starting_point.y).to eq(4)
  end

  it 'asserts that the user input for x and y are integers' do
    expect { coordinates(x: '12') }.to raise_error(ArgumentError, "Coordinate must be an integer")
    expect { coordinates(y: '4') }.to raise_error(ArgumentError, "Coordinate must be an integer")
  end


  it 'has a starting point where the x and y coordinates are the same' do
    starting_point = coordinates(x: 3, y: 3)
    another_starting_point = coordinates(x: 3, y: 3)

    expect(starting_point).to eq(another_starting_point)
  end

  it 'has a starting point where the x coordinate are different but y coordinates are the same' do
    starting_point = coordinates(x: 5, y: 3)
    another_starting_point = coordinates(x: 1, y: 3)

    expect(starting_point).not_to eq(another_starting_point)
  end

  it 'has a starting point where the x and y coordinates are different' do
    starting_point = coordinates(x: 5, y: 6)
    another_starting_point = coordinates(x: 2, y: 3)

    expect(starting_point).not_to eq(another_starting_point)
  end

  it 'is not equal to hash'
  it 'cannot be initialized without a starting point'
  it 'has a starting point anywhere on the planet'

  private

  def coordinates(x: 0, y: 0)
    StartingPoint.new(x: x, y: y)
  end
end
