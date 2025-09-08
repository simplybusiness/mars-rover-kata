describe 'Mars Rover' do

   class MarsRover
    VALID_DIRECTIONS = %w[N E S W].freeze

    attr_reader :current_position, :current_direction

    def initialize(starting_point:, starting_direction:)
      unless VALID_DIRECTIONS.include?(starting_direction)
      raise ArgumentError, "Starting direction must be one of #{VALID_DIRECTIONS.join(', ')}"
    end

      @current_position  = starting_point
      @current_direction  = starting_direction
    end
  end

  it 'has an initial starting point' do
    mars_rover = MarsRover.new(starting_point: [0,0], starting_direction: 'N')
  
    expect(mars_rover.current_position).to eq([0,0])
  end

  it 'has an initial starting point anywhere on Mars' do
    mars_rover = MarsRover.new(starting_point: [1,1], starting_direction: 'N')

    expect(mars_rover.current_position).to eq([1,1])
  end

  it 'has a direction it is facing e.g. N' do
    mars_rover = MarsRover.new(starting_point: [0,0], starting_direction: 'N')

    expect(mars_rover.current_direction).to eq 'N'
  end

  it 'has a direction it is facing e.g. E' do
    mars_rover = MarsRover.new(starting_point: [1,1], starting_direction: 'E')

    expect(mars_rover.current_direction).to eq 'E'
  end
  it 'has a direction it is facing e.g. S' do
    mars_rover = MarsRover.new(starting_point: [1,1], starting_direction: 'S')

    expect(mars_rover.current_direction).to eq 'S'
  end
  it 'has a direction it is facing e.g. W' do
    mars_rover = MarsRover.new(starting_point: [3,4], starting_direction: 'W')

    expect(mars_rover.current_direction).to eq 'W'
  end

  it 'cannot have a direction outside of N, E, S and W e.g R' do
    expect { MarsRover.new(starting_point: [1, 3], starting_direction: 'X') }.to raise_error(ArgumentError)
  end


  it 'cannot face N, E, S and W at the same time'
  it 'cannot have a nil starting point'
end