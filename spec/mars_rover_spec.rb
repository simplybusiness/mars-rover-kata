describe 'Mars Rover' do
  class MarsRover
    attr_reader :current_position, :current_direction, :commands

    def initialize(starting_point:, starting_direction:, commands: [])
      raise ArgumentError, 'The starting direction must be one of N, E, S or W' unless ['N', 'E', 'S', 'W'].include? starting_direction
      raise ArgumentError, 'The starting point cannot be nil' if starting_point.nil?
      @current_position = starting_point
      @current_direction = starting_direction
      @commands = commands
    end

    def execute
      if @current_direction == 'N'
        @current_position = [@current_position[0], @current_position[1] + 1]
      elsif @current_direction == 'S'
        @current_position = [@current_position[0], @current_position[1] - 1]
      elsif @current_direction == 'E'
        @current_position = [@current_position[0] + 1, @current_position[1]]
      end
    end

    def x_coordinate
      @current_position[0]
    end

    def y_coordinate
      @current_position[1]
    end
  end

  it 'has an initial starting point' do
    mars_rover = MarsRover.new(starting_point: [0, 0], starting_direction: 'N')

    expect(mars_rover.current_position).to eq([0, 0])
  end

  it 'has an initial starting point anywhere on Mars' do
    mars_rover = MarsRover.new(starting_point: [1, 1], starting_direction: 'N')

    expect(mars_rover.current_position).to eq [1, 1]
  end

  it 'has a direction it is facing e.g. N' do
    mars_rover = MarsRover.new(starting_point: [0, 0], starting_direction: 'N')

    expect(mars_rover.current_direction).to eq 'N'
  end

  it 'has a direction it is facing e.g. E' do
    mars_rover = MarsRover.new(starting_point: [1, 1], starting_direction: 'E')

    expect(mars_rover.current_direction).to eq 'E'
  end

  it 'has a direction it is facing e.g. S' do
    mars_rover = MarsRover.new(starting_point: [1, 1], starting_direction: 'S')

    expect(mars_rover.current_direction).to eq 'S'
  end

  it 'has a direction it is facing e.g. W' do
    mars_rover = MarsRover.new(starting_point: [3, 4], starting_direction: 'W')

    expect(mars_rover.current_direction).to eq 'W'
  end

  it 'cannot have a direction outside of N, E, S and W e.g. R' do
    expect do
      MarsRover.new(starting_point: [0, 1], starting_direction: 'C')
    end.to raise_error(ArgumentError, 'The starting direction must be one of N, E, S or W')
  end

  it 'cannot face N, E, S and W simultaneously' do
    expect { MarsRover.new(starting_point: [-3, 1], starting_direction: ['N', 'E', 'S', 'W']) }.to(
      raise_error(ArgumentError, 'The starting direction must be one of N, E, S or W')
    )
  end
  it 'cannot have a nil starting point' do
    expect { MarsRover.new(starting_point: nil, starting_direction: 'E') }.to(
      raise_error(ArgumentError, 'The starting point cannot be nil')
    )
  end

  it 'receives a character array of commands from Earth' do
    mars_rover = MarsRover.new(starting_point: [0, 1], starting_direction: 'E', commands: ['f', 'b'])

    expect(mars_rover.commands).to eq ['f', 'b']
  end

  describe 'Moving forwards' do
    example "moving forward (1 step up the y-axis) when facing north" do
      mars_rover = MarsRover.new(starting_point: [1, 2], starting_direction: 'N', commands: ['f'])

      mars_rover.execute

      expect { mars_rover.execute }.to change { mars_rover.y_coordinate }.by 1
      expect { mars_rover.execute }.not_to change { mars_rover.x_coordinate }
    end

    example "moving forward (1 step down the y-axis) when facing south" do
      mars_rover = MarsRover.new(starting_point: [1, 2], starting_direction: 'S', commands: ['f'])

      mars_rover.execute

      expect { mars_rover.execute }.to change { mars_rover.y_coordinate }.by(-1)
      expect { mars_rover.execute }.not_to change { mars_rover.x_coordinate }
    end

    example "moving forward (1 step right on the x-axis) when facing east" do
      mars_rover = MarsRover.new(starting_point: [1, 2], starting_direction: 'E', commands: ['f'])

      mars_rover.execute

      expect { mars_rover.execute }.to change { mars_rover.x_coordinate }.by 1
      expect { mars_rover.execute }.not_to change { mars_rover.y_coordinate }
    end

    example 'moving forward when facing west'

    RSpec::Matchers.define :be_located_at do |expected_position|
      match { |mars_rover| mars_rover.current_position == expected_position }
    end
  end
end