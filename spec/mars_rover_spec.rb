# frozen_string_literal: true

require_relative '../lib/mars_rover'
RSpec.describe 'operating a mars rover' do # rubocop:disable Metrics/BlockLength
  it 'has a starting position' do
    rover = MarsRover.new(0, 0, direction: :north)

    expect(rover).to be_located_at(0, 0)
  end
  it 'has a starting direction' do
    rover = MarsRover.new(0, 0, direction: :north)

    expect(rover.direction).to eq(:north)
  end
  it 'has a position on planet' do
    rover = MarsRover.new(1, 2, direction: :north)

    expect(rover).to be_located_at(1, 2)
  end
  it 'has a valid direction' do
    rover = MarsRover.new(0, 0, direction: :east)

    expect(rover.direction).to eq(:east)
  end
  it 'can move according to instructions' do
    rover = MarsRover.new(0, 0, direction: :north)
    expect(rover).to respond_to(:execute).with(1).argument
  end

  it 'cannot have negative coordinates'
  it 'cannot have a direction outside of north, south, east, or west'

  it 'increases y coordinate by 1 when moving forward while facing north' do
    rover = MarsRover.new(0, 0, direction: :north)
    rover.execute(['f'])

    expect(rover).to be_located_at(0, 1)
  end

  it 'the y coordinates decreases by 1 when facing south' do
    rover = MarsRover.new(3, 0, direction: :south)

    rover.execute(['f'])

    expect(rover).to be_located_at(3, -1)
  end

  it 'the x coordinates decreases by 1 when facing west' do
      rover = MarsRover.new(3, 0, direction: :west)

    rover.execute(['f'])

    expect(rover).to be_located_at(2, 0)
  end

  it 'the x coordinates increases by 1 when facing east'

  RSpec::Matchers.define :be_located_at do |x, y|
    match do |rover|
      rover.x_coordinate == x && rover.y_coordinate == y
    end
  end
end
