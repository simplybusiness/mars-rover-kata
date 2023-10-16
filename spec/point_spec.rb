require_relative '../lib/point'

describe Point do

  it 'returns a co-ordinate' do
    point =  Point.new(0, 0 ,'N')

    expect(point.coordinates).to eq('[0 0 N]')
  end

  it 'moves the x coordinate by a specific positive number' do
    point =  Point.new(0, 0, 'N')

    point.move_x(1)

    expect(point.coordinates).to eq('[1 0 N]')
  end

  it 'moves the x coordinate by a specific negative number' do
    point =  Point.new(0, 0, 'N')

    point.move_x(-1)

    expect(point.coordinates).to eq('[-1 0 N]')
  end

  it 'does not move the x coordinate if the number is not an integer' do
    point =  Point.new(0, 0, 'N')

    point.move_x(1.0)

    expect(point.coordinates).to eq('[0 0 N]')
  end

  it 'moves the y coordinate by a specific positive number' do
    point =  Point.new(0, 0, 'N')

    point.move_y(1)

    expect(point.coordinates).to eq('[0 1 N]')
  end

  it 'moves the y coordinate by a specific negative number'do
    point =  Point.new(0, 0, 'N')

    point.move_y(-1)

    expect(point.coordinates).to eq('[0 -1 N]')
  end

  it 'does not move the y coordinate if the number is not an integer' do
    point =  Point.new(0, 0, 'N')

    point.move_y(1.0)

    expect(point.coordinates).to eq('[0 0 N]')
  end

  it 'has a starting direction of North' do
    point =  Point.new(0, 0, 'N')

    point.move_y(1.0)

    expect(point.direction).to eq('N')
  end

  it 'has a starting direction of North and a starting position of 0,0' do
    point =  Point.new(0, 0, 'N')

    point.move_y(1.0)

    expect(point.coordinates).to eq('[0 0 N]')
  end

  it 'returns a new point [1 0 N] when a point [0 0 N] is moved north by 1' do
    pending("TODO")
    point =  Point.new(0, 0, 'N')

    new_point = point.new_move_x(1)

    expect(new_point.coordinates).to_eq '[1 0 N]'
  end
end


