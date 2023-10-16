require_relative '../lib/point'

describe Point do

  it 'returns a co-ordinate' do
    point =  Point.new(0, 0 ,'N')

    expect(point.coordinates_with_direction).to eq('[0 0 N]')
  end

  it 'moves the x coordinate by a specific positive number' do
    point =  Point.new(0, 0, 'N')

    point.move_x(1)

    expect(point.coordinates_with_direction).to eq('[1 0 N]')
  end

  it 'moves the x coordinate by a specific negative number' do
    point =  Point.new(0, 0, 'N')

    point.move_x(-1)

    expect(point.coordinates_with_direction).to eq('[-1 0 N]')
  end

  it 'does not move the x coordinate if the number is not an integer' do
    point =  Point.new(0, 0, 'N')

    point.move_x(1.0)

    expect(point.coordinates_with_direction).to eq('[0 0 N]')
  end

  it 'moves the y coordinate by a specific positive number' do
    point =  Point.new(0, 0, 'N')

    point.move_y(1)

    expect(point.coordinates_with_direction).to eq('[0 1 N]')
  end

  it 'moves the y coordinate by a specific negative number'do
    point =  Point.new(0, 0, 'N')

    point.move_y(-1)

    expect(point.coordinates_with_direction).to eq('[0 -1 N]')
  end

  it 'does not move the y coordinate if the number is not an integer' do
    point =  Point.new(0, 0, 'N')

    point.move_y(1.0)

    expect(point.coordinates_with_direction).to eq('[0 0 N]')
  end

  it 'has a starting direction of North' do
    point =  Point.new(0, 0, 'N')

    point.move_y(1.0)

    expect(point.direction).to eq('N')
  end

  it 'has a starting direction of North and a starting position of 0,0' do
    point =  Point.new(0, 0, 'N')

    point.move_y(1.0)

    expect(point.coordinates_with_direction).to eq('[0 0 N]')
  end
end


