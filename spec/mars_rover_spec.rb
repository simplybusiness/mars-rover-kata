# frozen_string_literal: true

require_relative '../lib/mars_rover'
RSpec.describe 'operating a mars rover' do # rubocop:disable Metrics/BlockLength
  it 'has a starting position' do
    rover = MarsRover.new(0, 0, direction: :north)

    expected_x_coordinate = 0
    expected_y_coordinate = 0
    expect(rover.x_coordinate).to eq(expected_x_coordinate)
    expect(rover.y_coordinate).to eq(expected_y_coordinate)
  end
  it 'has a starting direction' do
    rover = MarsRover.new(0, 0, direction: :north)

    expect(rover.direction).to eq(:north)
  end
  it 'has a position on planet' do
    rover = MarsRover.new(1, 2, direction: :north)

    expected_x_coordinate = 1
    expected_y_coordinate = 2
    expect(rover.x_coordinate).to eq(expected_x_coordinate)
    expect(rover.y_coordinate).to eq(expected_y_coordinate)
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

    expected_x_coordinate = 0
    expected_y_coordinate = 1
    expect(rover.x_coordinate).to eq(expected_x_coordinate)
    expect(rover.y_coordinate).to eq(expected_y_coordinate)
  end

  it 'the y coordinates decreases by 1 when facing south'
  it 'the x coordinates decreases by 1 when facing west'
  it 'the x coordinates increases by 1 when facing east'

  RSpec::Matchers.define :be_located_at do |x, y|
    match do |rover|
      rover.x_coordinate == x && rover.y_coordinate == y
    end
  end
end
