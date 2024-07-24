
class StartingPoint
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end

  def inspect
    "a starting point located at #{x}, #{y}"
  end
end


describe 'starting point' do
  it 'starts with a x and y coordinate' do
    starting_point = StartingPoint.new

    expect(starting_point.x).to eq(0)
    expect(starting_point.y).to eq(0)
  end

  it 'starts with a different x and y coordinate' do
    starting_point = StartingPoint.new(x: 2, y: 4)

    expect(starting_point.x).to eq(2)
    expect(starting_point.y).to eq(4)
  end
  it 'validate the x and y coordinate'
  it 'has a starting point where the x and y coordinates are the same'
  it 'has a starting point where the x coordinate are different but y coordinates are the same'
  it 'has a starting point where the y coordinate are different but x coordinates are the same'
  it 'is not equal to hash'
  it 'cannot be initialized without a starting point'
  it 'has a starting point anywhere on the planet'
end
