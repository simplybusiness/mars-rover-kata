require_relative '../lib/mars_rover'

describe MarsRover do
  it 'equals 2 ' do
    expect(1 + 1).to eq 2
  end

  it 'has a starting position of (2,3)' do
    mars_rover = MarsRover.new(2, 3, 'N')

    point = mars_rover.point
    expect(point).to eq OpenStruct.new(x: 2, y: 3)
  end

  it 'has a starting facing direction of N'

  it 'has a starting position of (1,2) and a facing direction of S'

  it 'does not have a starting direction of (1,4)'
end
