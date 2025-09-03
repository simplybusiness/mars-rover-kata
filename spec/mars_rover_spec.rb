describe 'Mars Rover' do

   class MarsRover
    attr_reader :current_position

    def initialize(starting_point:)
      @current_position  = starting_point
      @current_direction  = 'N'
    end

    def current_direction
      @current_direction
    end
   end


  it 'has an initial starting point' do
    mars_rover = MarsRover.new(starting_point: [0,0])
  
    expect(mars_rover.current_position).to eq([0,0])
  end

  it 'has an initial starting point anywhere on Mars' do
    mars_rover = MarsRover.new(starting_point: [1,1])

    expect(mars_rover.current_position).to eq([1,1])
  end

  it 'has a direction it is facing e.g. N' do
    mars_rover = MarsRover.new(starting_point: [0,0])

    expect(mars_rover.current_direction).to eq 'N'
  end

  it 'has a direction it is facing e.g. E'
  it 'has a direction it is facing e.g. S'
  it 'has a direction it is facing e.g. W'
  it 'cannot have a direction outside of N, E, S and W e.g R'
  it 'cannot face N, E, S and W at the same time'
  it 'cannot have a nil starting point'
end