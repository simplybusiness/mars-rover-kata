require_relative '../rover'

RSpec.describe Rover do
  # example of a pending test
  it 'knows its starting position'

  it 'has a starting position that is not null' do
    rov = Rover.new
    expect(rov.current_position).not_to be_nil
  end

  it 'raises an argument error when the coordinates passed are not floats' do
    expect { Rover.new(x: 'Z') }.to raise_error(ArgumentError, /Invalid coordinates/)
    expect { Rover.new(y: 'Z') }.to raise_error(ArgumentError, /Invalid coordinates/)
  end

  it 'raises an argument error when initialized with an invalid direction' do
    expect { Rover.new(direction: 'Z') }.to raise_error(ArgumentError, /Invalid direction/)
  end

  it 'holds the character array of commands' do
    expect { Rover.new(commands: [1, 2, 3]) }.to raise_error(ArgumentError, /Commands must be/)
    expect { Rover.new(commands: [1]) }.to raise_error(ArgumentError, /Commands must be/)
    expect { Rover.new(commands: ['A', 23]) }.to raise_error(ArgumentError, /Commands must be/)
    expect { Rover.new(commands: %w[A ABSDF]) }.to raise_error(ArgumentError, /Commands must be/)
  end

  it 'can move backwards and forwards in the same command list when facing North' do
    rov = Rover.new(direction: 'N', commands: %w[f f b b b])
    expect(rov.current_position).to eq([0, 0])

    rov.move
    expect(rov.current_position).to eq([0, -1])
  end
end
