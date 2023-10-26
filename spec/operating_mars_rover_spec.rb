require 'mars_rover_helper'
RSpec.describe 'Operating a Mars Rover' do
  it 'has a starting position at the origin' do
    mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: 'E'))

    expected_position = Coordinates.new(x: 0, y: 0)
    expect(mars_rover).to be_located_at(expected_position)
  end

  it 'has a starting position anywhere away from an origin' do
    mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 1, y: 1), direction: 'N'))

    expected_position = Coordinates.new(x: 1, y: 1)
    expect(mars_rover).to be_located_at(expected_position)
  end

  it 'has a direction' do
    mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 1, y: 2), direction: 'S'))

    expect(mars_rover).to be_facing('S')
  end

  %w{N E S W}.each do |direction|
    it "can face any direction, e.g. #{direction}" do
      mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 2, y: 0), direction: direction))

      expect(mars_rover).to be_facing(direction)
    end
  end

  ['Unsupported', 'A', 1, {direction: 'north'}].each do |direction|
    it "cannot be operated when it has a direction that is not north, east, south or west e.g. '#{direction}'" do
      pending 'Discussion with the customer'
      expect { a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 1, y: 0), direction: direction)) }
        .to raise_error('Direction must be one of N, E, S or W')
    end

  end

  [nil, '(1, 1)', 1, 2.4].each do |starting_point|
    it "cannot be operated when it is not given a starting position e.g. #{starting_point.inspect}" do
      pending 'Discussion with the customer'
      expect { a_mars_rover(located_at: Location.new(coordinates: starting_point, direction: 'W')) }
        .to raise_error('A starting position in the form of coordinates must be provided')
    end
  end

  it 'receives a list of commands' do
    mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: 'S'))

    expect(mars_rover).to respond_to(:execute).with(1)
  end

  it 'cannot interpret commands when they are a string' do
    pending 'Discussion with the customer'
    expect {a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: 'W')).execute('f') }
      .to raise_error('A command must consist of a list of individual commands e.g. %w{f b l r}')
  end

  it 'does not execute any commands it does not recognise' do
    mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 1, y: 5), direction: 'W'))

    expect { mars_rover.execute(['x']) }.not_to change(mars_rover, :direction)
    expect { mars_rover.execute(['z']) }.not_to change(mars_rover, :current_position)
  end
  it 'fails to execute any commands it does not recognise by raising an exception'

  it 'can traverse a complicated path consisting of all supported commands f, b, l and r' do
    mars_rover = a_mars_rover(located_at: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: 'N'))

    mars_rover.execute(%w{f r f f r f l b})
    expect(mars_rover).to be_located_at(Coordinates.new(x: 1, y: 0)).and be_facing('E')
  end

  private

  def a_mars_rover(located_at:)
    MarsRover.new(map: Map.new(x_domain: (0..10), y_domain: (0..10)), starting_location: located_at)
  end
end