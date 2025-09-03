describe 'Mars Rover' do
  class MarsRover
    attr_reader :current_position, :current_direction

    def initialize(starting_point:, starting_direction:)
      @current_position = starting_point
      @current_direction = starting_direction
    end
  end

  it 'has an initial starting point' do
    mars_rover = MarsRover.new(starting_point: [0, 0], starting_direction: 'N')

    expect(mars_rover.current_position).to eq([0, 0])
  end

  it 'has an initial starting point anywhere on Mars' do
    mars_rover = MarsRover.new(starting_point: [1, 1], starting_direction: 'N')

    expect(mars_rover.current_position).to eq([1, 1])
  end

  it 'has a direction it is facing in e.g. N' do
    mars_rover = MarsRover.new(starting_point: [0, 0], starting_direction: 'N')

    expect(mars_rover.current_direction).to eq 'N'
  end

  it 'has a direction it is facing e.g. E'
    mars_rover = MarsRover.new(starting_point: [1, 1], starting_direction: 'E') do

    expect(mars_rover.current_direction).to eq 'E'
  end

  it 'has a direction it is facing e.g. S'
    mars_rover = MarsRover.new(starting_point: [1, 1], starting_direction: 'S') do

    expect(mars_rover.current_direction).to eq 'S'
  end

  it 'has a direction it is facing e.g. W'
    mars_rover = MarsRover.new(starting_point: [1, 1], starting_direction: 'W') do

    expect(mars_rover.current_direction).to eq 'W'
  end

  it 'cannot have a direction other than N, E, S and W e.g. R'
  it 'cannot face N, E, S and W simultaneously'
  it 'cannot have a nil starting point'
end