require_relative '../lib/mars_rover'

describe MarsRover do
  it 'has a starting position of (2, 3) and a facing direction of N]' do
    mars_rover = MarsRover.new(Point.new(2,3, 'N'))

    expect(mars_rover).to be_located_at Point.new(2, 3,'N')
  end

  it 'has a starting position of (1,2) and a facing direction of S' do
    mars_rover = MarsRover.new(Point.new(1,2, 'S'))

    expect(mars_rover).to be_located_at Point.new(1, 2,'S')
  end

  it 'does not process unrecognised commands (e.g. command y)'

  it 'moves forwards when facing north' do
    mars_rover = MarsRover.new(Point.new(0,0, 'N'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover).to be_located_at Point.new(0, 1,'N')
  end

  it 'moves forwards when facing south' do
    mars_rover = MarsRover.new(Point.new(0,1, 'S'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover).to be_located_at Point.new(0, 0,'S')
  end

  it 'moves forwards when facing west' do
    mars_rover = MarsRover.new( Point.new(0,0, 'W'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover).to be_located_at Point.new(-1, 0,'W')
  end

  it 'moves forwards when facing east' do
    mars_rover = MarsRover.new(Point.new(0,0, 'E'))

    mars_rover.execute_commands(%w[f])

    expect(mars_rover).to be_located_at Point.new(1, 0,'E')
  end

  it 'moves backwards when facing north' do
    mars_rover = MarsRover.new(Point.new(0,1, 'N'))

    mars_rover.execute_commands(%w[b])

    expect(mars_rover).to be_located_at Point.new(0, 0,'N')
  end

  it 'moves backwards when facing south' do
    mars_rover = MarsRover.new(Point.new(0,0, 'S'))

    mars_rover.execute_commands(%w[b])

    expect(mars_rover).to be_located_at Point.new(0, 1,'S')
  end

  it 'moves left when facing North' do
    mars_rover = MarsRover.new(Point.new(0,0, 'N'))

    mars_rover.execute_commands(%w[l])

    expect(mars_rover).to be_located_at Point.new(0, 0,'W')
  end

  it 'moves left when facing South' do
    mars_rover = MarsRover.new(Point.new(0,0, 'S'))

    mars_rover.execute_commands(%w[l])

    expect(mars_rover).to be_located_at Point.new(0, 0,'E')
  end

  it 'moves left when facing West' do
    mars_rover = MarsRover.new(Point.new(0,0, 'W'))

    mars_rover.execute_commands(%w[l])

    expect(mars_rover).to be_located_at Point.new(0, 0,'S')
  end

  it 'moves left when facing East' do
    mars_rover = MarsRover.new(Point.new(0,0, 'E'))

    mars_rover.execute_commands(%w[l])

    expect(mars_rover).to be_located_at Point.new(0, 0,'N')
  end

  it 'moves right when facing North' do
    pending("TODO")
    mars_rover = MarsRover.new(Point.new(0,0, 'N'))

    mars_rover.execute_commands(%w[r])

    expect(mars_rover).to be_located_at Point.new(0, 0,'E')
  end

  it 'moves right when facing South' do
    pending("TODO")
    mars_rover = MarsRover.new(Point.new(0,0, 'S'))

    mars_rover.execute_commands(%w[r])

    expect(mars_rover).to be_located_at Point.new(0, 0,'W')
  end

  it 'moves right when facing East' do
    pending("TODO")
    mars_rover = MarsRover.new(Point.new(0,0, 'E'))

    mars_rover.execute_commands(%w[r])

    expect(mars_rover).to be_located_at Point.new(0, 0,'S')
  end

  it 'moves right when facing West' do
    pending("TODO")
    mars_rover = MarsRover.new(Point.new(0,0, 'W'))

    mars_rover.execute_commands(%w[r])

    expect(mars_rover).to be_located_at Point.new(0, 0,'N')
  end

  RSpec::Matchers.define :be_located_at do |expected_point|
    match do |mars_rover|
      mars_rover.point == expected_point
    end
    failure_message do |mars_rover|
      "expected that #{mars_rover} would have the same coordinates as #{expected_point}. Coordinates:\n
      ACTUAL | EXPECTED\n
        X: #{mars_rover.point.x} | #{expected_point.x}\n
        Y: #{mars_rover.point.y} | #{expected_point.y}\n
        D: #{mars_rover.point.direction} | #{expected_point.direction}\n"
    end
  end
end
