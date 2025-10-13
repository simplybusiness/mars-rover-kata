require_relative '../rover'

RSpec.describe Rover do
  # example of a pending test
  it 'knows its starting position'

  it 'has a starting position that is not null' do
    rov = Rover.new
    expect(rov.current_position).not_to be_nil
  end

  it 'can be initialized with custom starting coordinates' do
    rov = Rover.new(x: 3, y: 3)
    expect(rov.current_position).to eq([3, 3])
  end

  it 'raises an argument error when the coordinates passed are not floats' do
    expect { Rover.new(x: 'Z') }.to raise_error(ArgumentError, /Invalid coordinates/)
    expect { Rover.new(y: 'Z') }.to raise_error(ArgumentError, /Invalid coordinates/)
  end

  it 'has a starting direction that is one of N, S, E, W' do
    rov = Rover.new
    valid_directions = %w[N S E W]
    expect(valid_directions).to include(rov.direction)
  end

  it 'can be initialized with all custom directions' do
    rov_s = Rover.new(direction: 'S')
    expect(rov_s.direction).to eq('S')

    rov_e = Rover.new(direction: 'E')
    expect(rov_e.direction).to eq('E')

    rov_w = Rover.new(direction: 'W')
    expect(rov_w.direction).to eq('W')
  end

  it 'raises an argument error when initialized with an invalid direction' do
    expect { Rover.new(direction: 'Z') }.to raise_error(ArgumentError, /Invalid direction/)
  end

  it 'holds the character array of commands' do
    rov = Rover.new(commands: %w[f b f b])
    expect(rov.commands).to eq(%w[f b f b])

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

  it 'faces east after turning right when facing north' do
    rov = Rover.new(direction: 'N', commands: ['r'])
    expect(rov.direction).to eq('N')

    rov.move
    expect(rov.direction).to eq('E')
  end

  it 'faces south after turning right when facing east' do
    rov = Rover.new(direction: 'E', commands: ['r'])
    expect(rov.direction).to eq('E')

    rov.move
    expect(rov.direction).to eq('S')
  end

  it 'faces west after turning right when facing south' do
    rov = Rover.new(direction: 'S', commands: ['r'])
    expect(rov.direction).to eq('S')

    rov.move
    expect(rov.direction).to eq('W')
  end

  it 'faces north after turning right when facing west' do
    rov = Rover.new(direction: 'W', commands: ['r'])
    expect(rov.direction).to eq('W')

    rov.move
    expect(rov.direction).to eq('N')
  end

  it 'faces the same direction when turning right 4 times' do
    rov = Rover.new(direction: 'N', commands: %w[r r r r])
    expect(rov.direction).to eq('N')

    rov.move
    expect(rov.direction).to eq('N')
  end
end
