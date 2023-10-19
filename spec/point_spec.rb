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
    point =  Point.new(0, 0, 'N')

    new_point = point.new_move_x(1)

    expect(new_point.coordinates).to eq('[1 0 N]')
  end

  it 'returns a new point [0 1 N] when a point [0 0 N] is moved east by 1' do
    point =  Point.new(0, 0, 'E')

    new_point = point.new_move_y(1)

    expect(new_point.coordinates).to eq('[0 1 E]')
  end

  it 'returns true when equals is called on a point with another point with the same coordinates' do
    point_1 =  Point.new(0, 0, 'E')
    point_2 =  Point.new(0, 0, 'E')

    expect(point_1).to eq(point_2)
  end

  it 'returns false when equals is called on a point with another point with different coordinates' do
    point_1 =  Point.new(0, 0, 'E')
    point_2 =  Point.new(0, 0, 'W')

    expect(point_1).to_not eq(point_2)
  end
end


