require_relative '../rover'

RSpec.describe Rover do
  it 'moves forward facing North' do
    rov = Rover.new(direction: 'N', commands: ['f'])
    expect(rov.current_position).to eq([0, 0])

    rov.move
    expect(rov.current_position).to eq([0, 1])
  end

  it 'moves forward facing South' do
    rov_s = Rover.new(direction: 'S', commands: ['f'])
    expect(rov_s.current_position).to eq([0, 0])

    rov_s.move
    expect(rov_s.current_position).to eq([0, -1])
  end

  it 'moves forward facing East' do
    rov_e = Rover.new(direction: 'E', commands: ['f'])
    expect(rov_e.current_position).to eq([0, 0])

    rov_e.move
    expect(rov_e.current_position).to eq([1, 0])
  end

  it 'moves forward facing West' do
    rov_w = Rover.new(direction: 'W', commands: ['f'])
    expect(rov_w.current_position).to eq([0, 0])

    rov_w.move
    expect(rov_w.current_position).to eq([-1, 0])
  end

  it 'moves forward 10 times correctly' do
    rov = Rover.new(direction: 'N', commands: %w[f f f f f f f f f f])
    expect(rov.current_position).to eq([0, 0])

    rov.move
    expect(rov.current_position).to eq([0, 10])
  end
end