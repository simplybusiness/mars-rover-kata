require_relative '../rover'

RSpec.describe Rover do
  it 'moves backward correctly when facing North' do
    rov = Rover.new(direction: 'N', commands: ['b'])
    expect(rov.current_position).to eq([0, 0])

    rov.move
    expect(rov.current_position).to eq([0, -1])
  end

  it 'moves backward correctly when facing South' do
    rov_s = Rover.new(direction: 'S', commands: ['b'])
    expect(rov_s.current_position).to eq([0, 0])

    rov_s.move
    expect(rov_s.current_position).to eq([0, 1])
  end

  it 'moves backward correctly when facing East' do
    rov_e = Rover.new(direction: 'E', commands: ['b'])
    expect(rov_e.current_position).to eq([0, 0])

    rov_e.move
    expect(rov_e.current_position).to eq([-1, 0])
  end

  it 'moves backward correctly when facing West' do
    rov_w = Rover.new(direction: 'W', commands: ['b'])
    expect(rov_w.current_position).to eq([0, 0])

    rov_w.move
    expect(rov_w.current_position).to eq([1, 0])
  end
end