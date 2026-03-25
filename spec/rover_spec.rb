require_relative '../lib/rover'

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
end
