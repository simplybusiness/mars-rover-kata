# frozen_string_literal: true

require_relative '../../../src/rover'

RSpec.describe Rover do
  it 'faces west after turning left when facing north' do
    rov = Rover.new(direction: 'N')

    expect { rov.move(commands: ['l']) }.to change(rov, :direction).from('N').to('W')
  end

  it 'faces north after turning left when facing east' do
    rov = Rover.new(direction: 'E')

    expect { rov.move(commands: ['l']) }.to change(rov, :direction).from('E').to('N')
  end

  it 'faces east after turning left when facing south' do
    rov = Rover.new(direction: 'S')

    expect { rov.move(commands: ['l']) }.to change(rov, :direction).from('S').to('E')
  end

  it 'faces south after turning left when facing west' do
    rov = Rover.new(direction: 'W')

    expect { rov.move(commands: ['l']) }.to change(rov, :direction).from('W').to('S')
  end

  it 'faces the same direction when turning left 4 times' do
    rov = Rover.new(direction: 'N')

    expect { rov.move(commands: %w[l l l l]) }.to_not change(rov, :direction)
  end
end
