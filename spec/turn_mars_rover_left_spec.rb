# frozen_string_literal: true

require_relative '../rover'

RSpec.describe Rover do
  it 'faces west after turning left when facing north' do
    rov = Rover.new(direction: 'N', commands: ['l'])

    expect { rov.move }.to change(rov, :direction).from('N').to('W')
  end

  it 'faces north after turning left when facing east' do
    rov = Rover.new(direction: 'E', commands: ['l'])

    expect { rov.move }.to change(rov, :direction).from('E').to('N')
  end

  it 'faces east after turning left when facing south' do
    rov = Rover.new(direction: 'S', commands: ['l'])

    expect { rov.move }.to change(rov, :direction).from('S').to('E')
  end

  it 'faces south after turning left when facing west' do
    rov = Rover.new(direction: 'W', commands: ['l'])

    expect { rov.move }.to change(rov, :direction).from('W').to('S')
  end

  it 'faces the same direction when turning left 4 times' do
    rov = Rover.new(direction: 'N', commands: %w[l l l l])

    expect { rov.move }.to_not change(rov, :direction)
  end
end
