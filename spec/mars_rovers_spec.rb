require_relative '../lib/mars_rover'

describe MarsRover do
  it 'equals 2 ' do
    expect(1 + 1).to eq 2
  end

  it 'has a starting position of (2,3)' do
    mars_rover = MarsRover.new( 'N', OpenStruct.new(x: 2, y: 3))

    point = mars_rover.point
    expect(point).to eq OpenStruct.new(x: 2, y: 3)
  end

  it 'has a starting facing direction of N' do
    mars_rover = MarsRover.new( 'N', OpenStruct.new(x: 2, y: 3))

    expect(mars_rover.direction).to eq 'N'
  end

  it 'has a starting position of (1,2) and a facing direction of S' do
    mars_rover = MarsRover.new('S', OpenStruct.new(x: 1, y: 2))

    expect(mars_rover.point).to eq OpenStruct.new(x: 1, y: 2)
    expect(mars_rover.direction).to eq 'S'
  end

  it 'does not process unrecognised commands (e.g. command y)'

  it 'moves forwards when facing north' do
    mars_rover = MarsRover.new('N', OpenStruct.new(x: 0, y: 0))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.point).to eq(OpenStruct.new(x: 0, y: 1))
  end

  it 'moves forwards when facing south' do
    mars_rover = MarsRover.new('S', OpenStruct.new(x: 0, y: 1))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.point).to eq(OpenStruct.new(x: 0, y: 0))
  end

  it 'moves forwards when facing west' do
    mars_rover = MarsRover.new('W', OpenStruct.new(x: 0, y: 0))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.point).to eq(OpenStruct.new(x: -1, y: 0))
    expect(mars_rover.direction).to eq('W')
  end

  it 'moves forwards when facing east' do
    mars_rover = MarsRover.new('E', OpenStruct.new(x: 0, y: 0))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.point).to eq(OpenStruct.new(x: 1, y: 0))
    expect(mars_rover.direction).to eq('E')
  end

  it 'moves backwards when facing north' do
    mars_rover = MarsRover.new('N', OpenStruct.new(x: 0, y: 1))

    mars_rover.execute_commands(%w[b])

    expect(mars_rover.point).to eq(OpenStruct.new(x: 0, y: 0))
    expect(mars_rover.direction).to eq('N')
  end

  it 'moves backwards when facing south' do
    mars_rover = MarsRover.new('S', OpenStruct.new(x: 0, y: 0))

    mars_rover.execute_commands(%w[b])

    expect(mars_rover.point).to eq(OpenStruct.new(x: 0, y: 1))
    expect(mars_rover.direction).to eq('S')
  end
end
