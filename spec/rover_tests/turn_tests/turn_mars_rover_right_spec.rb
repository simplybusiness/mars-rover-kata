# frozen_string_literal: true

require_relative '../../../src/rover'

RSpec.describe Rover do
  it 'faces east after turning right when facing north' do
    rov = Rover.new(direction: 'N')

    expect { rov.move(commands: ['r']) }.to change(rov, :direction).from('N').to('E')
  end

  it 'faces south after turning right when facing east' do
    rov = Rover.new(direction: 'E')

    expect { rov.move(commands: ['r']) }.to change(rov, :direction).from('E').to('S')
  end

  it 'faces west after turning right when facing south' do
    rov = Rover.new(direction: 'S')

    expect { rov.move(commands: ['r']) }.to change(rov, :direction).from('S').to('W')
  end

  it 'faces north after turning right when facing west' do
    rov = Rover.new(direction: 'W')

    expect { rov.move(commands: ['r']) }.to change(rov, :direction).from('W').to('N')
  end

  it 'faces the same direction when turning right 4 times' do
    rov = Rover.new(direction: 'N')

    expect { rov.move(commands: %w[r r r r]) }.to_not change(rov, :direction)
  end
end
