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

  it 'cannot have a null position' do
    expect { MarsRover.new(nil, 'N') }.to raise_error('Invalid position')
  end

  it 'cannot accept anything other than array for position' do
    expect { MarsRover.new('1,2', 'N') }.to raise_error('Invalid position')
  end

  [
    [1, 'sad'],
    [nil, nil],
    [2.0, 3.1],
    [[0, 0], [2, 2]]
  ].each do |invalid_coordinates|
    it "cannot accept anything other than coordinates for position e.g. cannot accept #{invalid_coordinates}" do
      expect { MarsRover.new(invalid_coordinates, 'N') }.to raise_error('Invalid position')
    end
  end
end
