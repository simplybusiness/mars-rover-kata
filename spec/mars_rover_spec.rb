describe 'Mars Rover' do
  class MarsRover
    def initialize(starting_point:)

    end

    def current_position
      [0, 0]
    end
  end

  it 'has an initial starting point' do
    mars_rover = MarsRover.new(starting_point: [0, 0])

    expect(mars_rover.current_position).to eq([0, 0])
  end

  it 'has a direction it is facing e.g. N'
  it 'has a direction it is facing e.g. E'
  it 'has a direction it is facing e.g. S'
  it 'has a direction it is facing e.g. W'
  it 'cannot have a direction outside of N, E, S and W e.g. R'
  it 'cannot face N, E, S and W simultaneously'
  it 'cannot have a nil starting point'
end