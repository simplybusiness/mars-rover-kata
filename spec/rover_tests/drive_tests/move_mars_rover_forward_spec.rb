# frozen_string_literal: true

require_relative '../../../src/rover'

RSpec.describe Rover do
  it 'moves forward facing North' do
    rov = Rover.new(direction: 'N')

    expect { rov.move(commands: ['f']) }.to change(rov, :current_position).from([0, 0]).to([0, 1])
  end

  it 'moves forward facing South' do
    rov = Rover.new(direction: 'S')
    
    expect { rov.move(commands: ['f']) }.to change(rov, :current_position).from([0, 0]).to([0, -1])
  end

  it 'moves forward facing East' do
    rov = Rover.new(direction: 'E')
    
    expect { rov.move(commands: ['f']) }.to change(rov, :current_position).from([0, 0]).to([1, 0])
  end

  it 'moves forward facing West' do
    rov = Rover.new(direction: 'W')
    
    expect { rov.move(commands: ['f']) }.to change(rov, :current_position).from([0, 0]).to([-1, 0])
  end

  it 'moves forward 10 times correctly' do
    rov = Rover.new(direction: 'N')
    
    expect { rov.move(commands: %w[f f f f f f f f f f]) }.to change(rov, :current_position).from([0, 0]).to([0, 10])
  end
end
