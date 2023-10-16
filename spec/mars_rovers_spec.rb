require_relative '../lib/mars_rover'

describe MarsRover do
  it 'has a starting position of (2, 3) and a facing direction of N]' do
    mars_rover = MarsRover.new( 'N', OpenStruct.new(x: 2, y: 3), Point.new(2,3, 'N'))

    point = mars_rover.point
    new_point = mars_rover.new_point

    expect(point).to eq OpenStruct.new(x: 2, y: 3)
    expect(new_point.coordinates).to eq '[2 3]'
    expect(mars_rover.new_point.coordinates_with_direction).to eq '[2 3 N]'
  end

  it 'has a starting position of (1,2) and a facing direction of S' do
    mars_rover = MarsRover.new('S', OpenStruct.new(x: 1, y: 2), Point.new(2,3, 'S'))

    expect(mars_rover.new_point.coordinates_with_direction).to eq '[2 3 S]'
  end

  it 'does not process unrecognised commands (e.g. command y)'

  it 'moves forwards when facing north' do
    mars_rover = MarsRover.new('N', OpenStruct.new(x: 0, y: 0), Point.new(0,0, 'N'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.new_point.coordinates_with_direction).to eq '[0 1 N]'
  end

  it 'moves forwards when facing south' do
    mars_rover = MarsRover.new('S', OpenStruct.new(x: 0, y: 1),  Point.new(0,1, 'S'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.new_point.coordinates_with_direction).to eq '[0 0 S]'
  end

  it 'moves forwards when facing west' do
    mars_rover = MarsRover.new('W', OpenStruct.new(x: 0, y: 0),  Point.new(0,0, 'W'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.new_point.coordinates_with_direction).to eq '[-1 0 W]'
  end

  it 'moves forwards when facing east' do
    mars_rover = MarsRover.new('E', OpenStruct.new(x: 0, y: 0),  Point.new(0,0, 'E'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.new_point.coordinates_with_direction).to eq '[1 0 E]'
  end

  it 'moves backwards when facing north' do
    mars_rover = MarsRover.new('N', OpenStruct.new(x: 0, y: 1),  Point.new(0,1, 'N'))

    mars_rover.execute_commands(%w[b])

    expect(mars_rover.new_point.coordinates_with_direction).to eq '[0 0 N]'
  end

  it 'moves backwards when facing south' do
    mars_rover = MarsRover.new('S', OpenStruct.new(x: 0, y: 0),  Point.new(0,0, 'S'))

    mars_rover.execute_commands(%w[b])

    expect(mars_rover.new_point.coordinates_with_direction).to eq '[0 1 S]'
  end
end
