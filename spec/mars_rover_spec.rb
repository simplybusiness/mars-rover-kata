describe 'Mars Rover' do
  class MarsRover
    attr_reader :current_position, :current_direction

    def initialize(current_position, current_direction)
      @current_position = current_position
      @current_direction = current_direction
      raise 'Invalid direction' unless ['N', 'E', 'S', 'W'].include?(@current_direction)
      raise 'Invalid position' if @current_position.nil?
      raise 'Invalid position' unless @current_position.is_a?(Array)
      raise 'Invalid position' unless @current_position.all? { |coordinate| coordinate.is_a?(Integer) }
    end

    def commands(commands)
      commands
    end
  end

  it 'has an initial position' do
    mars_rover = MarsRover.new([1, 2],  'N')
    expect(mars_rover.current_position).to eq([1, 2])
  end

  it 'set the current direction as south' do
    mars_rover = MarsRover.new([5, 0], 'S')
    expect(mars_rover.current_direction).to eq('S')
  end
  it 'cannot have a direction outside of N, E, S or W' do
    expect { MarsRover.new([0, 0], 'Z') }.to raise_error('Invalid direction')
  end

  [
    [1, 'sad'],
    [nil, nil],
    [2.0, 3.1],
    [[0, 0], [2, 2]],
    ['1,2'],
    [nil]
  ].each do |invalid_coordinates|
    it "cannot accept anything other than coordinates for position e.g. cannot accept #{invalid_coordinates}" do
      expect { MarsRover.new(invalid_coordinates, 'N') }.to raise_error('Invalid position')
    end
  end
  it 'receives the array of characters as commands' do
    expect(MarsRover.new([1, 2], 'N').commands(['L','M','L'])).to eq(['L','M','L'])
    expect(MarsRover.new([1,2], 'N')).to respond_to(:commands).with(1).argument
  end

  it 'receives the command f and moves the rover forward'


  it 'receives the command b and moves the rover backward'

  context 'when the rover is facing north' do
    it 'receives the command f and moves the rover forward and current direction remains the same'
    it 'receives the command b and moves the rover backward and current direction is South'
  end

  context 'when the rover is facing east' do
    it 'receives the command f and moves the rover forward and current direction remains the same'
    it 'receives the command b and moves the rover backward and current direction is West'
  end

  context 'when the rover is facing south' do
    it 'receives the command f and moves the rover forward and current direction remains the same'
    it 'receives the command b and moves the rover backward and current direction is North'
  end

  context 'when the rover is facing west' do
    it 'receives the command f and moves the rover forward and current direction remains the same'
    it 'receives the command b and moves the rover backward and current direction is East'
  end

  context 'initial position is [0, 0] and direction is N' do
    it 'receives the command f and moves the rover forward to [0, 1]'
    it 'receives the command b and moves the rover backward to [0, -1]'
  end

  context 'initial position is [0, 0] and direction is E' do
    it 'receives the command f and moves the rover forward to [1, 0]'
    it 'receives the command b and moves the rover backward to [-1, 0]'
  end

  context 'initial position is [0, 0] and direction is S' do
    it 'receives the command f and moves the rover forward to [0, -1]'
    it 'receives the command b and moves the rover backward to [0, 1]'
  end

  context 'initial position is [0, 0] and direction is W' do
    it 'receives the command f and moves the rover forward to [-1, 0]'
    it 'receives the command b and moves the rover backward to [1, 0]'
  end

  ['n','dsf','@@', '2','F', 'B'].each do |invalid_command|
    it "cannot accept anything other than f, b for commands e.g. cannot accept #{invalid_command}"
  end
end
