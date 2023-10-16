require_relative '../lib/point'

describe Point do

  it 'returns a co-ordinate' do
    point =  Point.new(0, 0)

    expect(point.coordinates).to eq('[0 0]')
  end

  it 'moves the x coordinate by a specific positive number' do
    point =  Point.new(0, 0)

    point.move_x(1)

    expect(point.coordinates).to eq('[1 0]')
  end

  it 'moves the x coordinate by a specific negative number' do
    point =  Point.new(0, 0)

    point.move_x(-1)

    expect(point.coordinates).to eq('[-1 0]')
  end

  it 'does not move the x coordinate if the number is not an integer' do
    point =  Point.new(0, 0)

    point.move_x(1.0)

    expect(point.coordinates).to eq('[0 0]')
  end

  it 'moves the y coordinate by a specific positive number' do
    point =  Point.new(0, 0)

    point.move_y(1)

    expect(point.coordinates).to eq('[0 1]')
  end

  it 'moves the y coordinate by a specific negative number'do
    point =  Point.new(0, 0)

    point.move_y(-1)

    expect(point.coordinates).to eq('[0 -1]')
  end

  it 'does not move the y coordinate if the number is not an integer' do
    point =  Point.new(0, 0)

    point.move_y(1.0)

    expect(point.coordinates).to eq('[0 0]')
  end
end


