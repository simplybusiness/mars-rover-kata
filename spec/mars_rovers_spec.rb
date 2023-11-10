require_relative '../lib/mars_rover'

describe MarsRover do
  it 'has a starting position of (2, 3) and a facing direction of N]' do
    mars_rover = MarsRover.new(Point.new(2,3, 'N'))

    expect(mars_rover.point).to eq Point.new(2, 3,'N')
  end

  it 'has a starting position of (1,2) and a facing direction of S' do
    mars_rover = MarsRover.new(Point.new(1,2, 'S'))

    expect(mars_rover.point).to eq Point.new(1, 2,'S')
  end

  it 'does not process unrecognised commands (e.g. command y)'

  it 'moves forwards when facing north' do
    mars_rover = MarsRover.new(Point.new(0,0, 'N'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.point).to eq Point.new(0, 1,'N')
  end

  it 'moves forwards when facing south' do
    mars_rover = MarsRover.new(Point.new(0,1, 'S'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.point).to eq Point.new(0, 0,'S')
  end

  it 'moves forwards when facing west' do
    mars_rover = MarsRover.new( Point.new(0,0, 'W'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.point).to eq Point.new(-1, 0,'W')
  end

  it 'moves forwards when facing east' do
    mars_rover = MarsRover.new(Point.new(0,0, 'E'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover.point).to eq Point.new(1, 0,'E')
  end

  it 'moves backwards when facing north' do
    mars_rover = MarsRover.new(Point.new(0,1, 'N'))

    mars_rover.execute_commands(%w[b])

    expect(mars_rover.point).to eq Point.new(0, 0,'N')
  end

  it 'moves backwards when facing south' do
    mars_rover = MarsRover.new(Point.new(0,0, 'S'))

    mars_rover.execute_commands(%w[b])

    expect(mars_rover.point).to eq Point.new(0, 1,'S')
  end

  it 'moves left when facing North' do
    mars_rover = MarsRover.new(Point.new(0,0, 'N'))

    mars_rover.execute_commands(%w[l])

    expect(mars_rover.point).to eq Point.new(-1, 0,'N')
  end

  it 'moves left when facing East' do
    mars_rover = MarsRover.new(Point.new(0,0, 'E'))

    mars_rover.execute_commands(%w[l])

    expect(mars_rover.point).to eq Point.new(0, 1,'E')
  end

  it 'moves right when facing South' do
    mars_rover = MarsRover.new(Point.new(0,0, 'S'))

    mars_rover.execute_commands(%w[r])

    expect(mars_rover.point).to eq Point.new(-1, 0,'S')
  end

  it 'moves right when facing West' do
    mars_rover = MarsRover.new(Point.new(0,0, 'W'))

    mars_rover.execute_commands(%w[r])

    expect(mars_rover.point).to eq Point.new(0, 1,'W')
  end
end
