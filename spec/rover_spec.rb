require_relative '../lib/rover'
require_relative '../lib/grid'

RSpec.describe Rover do
  it 'has a starting position and direction' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end

  it 'receives an empty array of commands' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    rover.execute([])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end

  it 'ignores unrecognized commands' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    rover.execute(%w[x z])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end

  it 'moves forward one step when facing north' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    rover.execute(['f'])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(1)
  end

  it 'moves forward multiple steps when facing north' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    rover.execute(%w[f f f])

    expect(rover.y).to eq(3)
  end

  it 'moves backward one step when facing north' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    rover.execute(['b'])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(-1)
  end

  it 'moves forward one step when facing east' do
    rover = Rover.new(x: 0, y: 0, direction: :E)

    rover.execute(['f'])

    expect(rover.x).to eq(1)
    expect(rover.y).to eq(0)
  end

  it 'moves forward one step when facing south' do
    rover = Rover.new(x: 0, y: 0, direction: :S)

    rover.execute(['f'])

    expect(rover.y).to eq(-1)
  end

  it 'moves forward one step when facing west' do
    rover = Rover.new(x: 0, y: 0, direction: :W)

    rover.execute(['f'])

    expect(rover.x).to eq(-1)
  end

  it 'moves backward one step when facing east' do
    rover = Rover.new(x: 0, y: 0, direction: :E)

    rover.execute(['b'])

    expect(rover.x).to eq(-1)
  end

  it 'moves backward one step when facing south' do
    rover = Rover.new(x: 0, y: 0, direction: :S)

    rover.execute(['b'])

    expect(rover.y).to eq(1)
  end

  it 'moves backward one step when facing west' do
    rover = Rover.new(x: 0, y: 0, direction: :W)

    rover.execute(['b'])

    expect(rover.x).to eq(1)
  end

  it 'turns right from north to face east' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    rover.execute(['r'])

    expect(rover.direction).to eq(:E)
    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
  end

  it 'turns right from east to face south' do
    rover = Rover.new(x: 0, y: 0, direction: :E)

    rover.execute(['r'])

    expect(rover.direction).to eq(:S)
  end

  it 'turns right four times to face north again' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    rover.execute(%w[r r r r])

    expect(rover.direction).to eq(:N)
  end

  it 'turns left from north to face west' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    rover.execute(['l'])

    expect(rover.direction).to eq(:W)
  end

  it 'turns left from south to face east' do
    rover = Rover.new(x: 0, y: 0, direction: :S)

    rover.execute(['l'])

    expect(rover.direction).to eq(:E)
  end

  it 'executes a complex path with all four commands' do
    rover = Rover.new(x: 0, y: 0, direction: :N)

    rover.execute(%w[f f r f f l b])

    expect(rover.x).to eq(2)
    expect(rover.y).to eq(1)
    expect(rover.direction).to eq(:N)
  end

  it 'accepts a grid' do
    grid = Grid.new(width: 10, height: 10)
    rover = Rover.new(x: 0, y: 0, direction: :N, grid: grid)

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
  end

  it 'wraps when moving north past the top edge' do
    grid = Grid.new(width: 5, height: 5)
    rover = Rover.new(x: 0, y: 4, direction: :N, grid: grid)

    rover.execute(['f'])

    expect(rover.y).to eq(0)
    expect(rover.x).to eq(0)
  end

  it 'wraps when moving south past the bottom edge' do
    grid = Grid.new(width: 5, height: 5)
    rover = Rover.new(x: 0, y: 0, direction: :S, grid: grid)

    rover.execute(['f'])

    expect(rover.y).to eq(4)
  end

  it 'wraps when moving east past the right edge' do
    grid = Grid.new(width: 5, height: 5)
    rover = Rover.new(x: 4, y: 0, direction: :E, grid: grid)

    rover.execute(['f'])

    expect(rover.x).to eq(0)
  end

  it 'wraps when moving west past the left edge' do
    grid = Grid.new(width: 5, height: 5)
    rover = Rover.new(x: 0, y: 0, direction: :W, grid: grid)

    rover.execute(['f'])

    expect(rover.x).to eq(4)
  end
end
