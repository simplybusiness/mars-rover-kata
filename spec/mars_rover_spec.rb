require_relative '../lib/mars_rover.rb'
describe MarsRover do
  let(:mars_rover) { MarsRover.new(starting_position: [0, 0], direction: 'N') }

  it "has a valid starting position" do
    expect(mars_rover.starting_position).to eq([0, 0])
  end

  it "has a valid direction of travel" do
    expect(mars_rover.direction).to eq('N')
  end

  it "raises an error for an invalid direction" do
    expect { MarsRover.new(starting_position: [0, 0], direction: 'X') }
      .to raise_error(ArgumentError, /Invalid direction/)
  end

  it "accepts all valid directions" do
    %w[N S E W].each do |dir|
      expect { MarsRover.new(starting_position: [0, 0], direction: dir) }.not_to raise_error
    end
  end

  it "raises an error for non-integer coordinates" do
    expect { MarsRover.new(starting_position: ['a', 0], direction: 'N') }
      .to raise_error(ArgumentError, /Invalid starting position/)
  end

  it "raises an error for wrong number of coordinates" do
    expect { MarsRover.new(starting_position: [0], direction: 'N') }
      .to raise_error(ArgumentError, /Invalid starting position/)
  end

  it "can receive a character array of commands" do
    expect(MarsRover.new(starting_position: [0, 0], direction: 'S')).to respond_to :movements
  end
  
end