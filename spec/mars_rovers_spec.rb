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
end
