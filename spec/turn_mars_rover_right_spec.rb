require_relative '../rover'

RSpec.describe Rover do
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