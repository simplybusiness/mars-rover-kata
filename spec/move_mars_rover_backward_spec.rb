# frozen_string_literal: true

require_relative '../rover'

RSpec.describe Rover do
  it 'moves backward correctly when facing North' do
    rov = Rover.new(direction: 'N')

    expect { rov.move(commands: ['b']) }.to change(rov, :current_position).from([0, 0]).to([0, -1])
  end

  it 'moves backward correctly when facing South' do
    rov = Rover.new(direction: 'S')
    
    expect { rov.move(commands: ['b']) }.to change(rov, :current_position).from([0, 0]).to([0, 1])
  end

  it 'moves backward correctly when facing East' do
    rov = Rover.new(direction: 'E')
    
    expect { rov.move(commands: ['b']) }.to change(rov, :current_position).from([0, 0]).to([-1, 0])
  end

  it 'moves backward correctly when facing West' do
    rov = Rover.new(direction: 'W')
    
    expect { rov.move(commands: ['b']) }.to change(rov, :current_position).from([0, 0]).to([1, 0])
  end

  it 'moves forward 10 times correctly' do
    rov = Rover.new(direction: 'N')
    
    expect { rov.move(commands: %w[b b b b b b b b b b]) }.to change(rov, :current_position).from([0, 0]).to([0, -10])
  end
end
