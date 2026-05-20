# frozen_string_literal: true

require_relative '../lib/rover'
require_relative '../lib/grid'

RSpec::Matchers.define :be_at do |expected|
  match do |rover|
    rover.x == expected[:x] &&
      rover.y == expected[:y] &&
      rover.direction == expected[:direction]
  end

  failure_message do |rover|
    "expected rover at (#{expected[:x]}, #{expected[:y]}) facing #{expected[:direction]}, " \
      "got (#{rover.x}, #{rover.y}) facing #{rover.direction}"
  end
end

RSpec::Matchers.define :be_obstructed_at do |expected|
  match do |rover|
    rover.x == expected[:x] &&
      rover.y == expected[:y] &&
      rover.obstacle_detected?
  end

  failure_message do |rover|
    "expected rover obstructed at (#{expected[:x]}, #{expected[:y]}), " \
      "got (#{rover.x}, #{rover.y}) obstacle_detected? = #{rover.obstacle_detected?}"
  end
end

RSpec.shared_examples 'a single-step command' do |command, cases|
  cases.each do |label, params|
    it "ends in expected state #{label}" do
      rover = rover_facing(params[:start])

      rover.execute([command])

      expect(rover).to be_at(x: params[:x], y: params[:y], direction: params[:direction])
    end
  end
end

RSpec.describe Rover do
  def rover_facing(direction, x: 0, y: 0, grid: nil)
    Rover.new(x: x, y: y, direction: direction, grid: grid)
  end

  def grid_with_obstacles(obstacles = [], width: 5, height: 5)
    Grid.new(width: width, height: height, obstacles: obstacles)
  end

  describe 'initial state' do
    it 'has a starting position and direction' do
      rover = rover_facing(:N)

      expect(rover).to be_at(x: 0, y: 0, direction: :N)
    end
  end

  context 'with empty commands' do
    it 'receives an empty array of commands' do
      rover = rover_facing(:N)

      rover.execute([])

      expect(rover).to be_at(x: 0, y: 0, direction: :N)
    end
  end

  context 'with unrecognized commands' do
    it 'ignores unrecognized commands' do
      rover = rover_facing(:N)

      rover.execute(%w[x z])

      expect(rover).to be_at(x: 0, y: 0, direction: :N)
    end
  end

  context 'when moving forward' do
    include_examples 'a single-step command', 'f',
                     'facing N' => { start: :N, x: 0,  y: 1,  direction: :N },
                     'facing E' => { start: :E, x: 1,  y: 0,  direction: :E },
                     'facing S' => { start: :S, x: 0,  y: -1, direction: :S },
                     'facing W' => { start: :W, x: -1, y: 0,  direction: :W }

    it 'moves forward multiple steps when facing north' do
      rover = rover_facing(:N)

      rover.execute(%w[f f f])

      expect(rover).to be_at(x: 0, y: 3, direction: :N)
    end
  end

  context 'when moving backward' do
    include_examples 'a single-step command', 'b',
                     'facing N' => { start: :N, x: 0,  y: -1, direction: :N },
                     'facing E' => { start: :E, x: -1, y: 0,  direction: :E },
                     'facing S' => { start: :S, x: 0,  y: 1,  direction: :S },
                     'facing W' => { start: :W, x: 1,  y: 0,  direction: :W }
  end

  context 'when turning right' do
    include_examples 'a single-step command', 'r',
                     'starting from N' => { start: :N, x: 0, y: 0, direction: :E },
                     'starting from E' => { start: :E, x: 0, y: 0, direction: :S }

    it 'turns right four times to face north again' do
      rover = rover_facing(:N)

      rover.execute(%w[r r r r])

      expect(rover).to be_at(x: 0, y: 0, direction: :N)
    end
  end

  context 'when turning left' do
    include_examples 'a single-step command', 'l',
                     'starting from N' => { start: :N, x: 0, y: 0, direction: :W },
                     'starting from S' => { start: :S, x: 0, y: 0, direction: :E }
  end

  context 'with a complex sequence of commands' do
    it 'executes a complex path with all four commands' do
      rover = rover_facing(:N)

      rover.execute(%w[f f r f f l b])

      expect(rover).to be_at(x: 2, y: 1, direction: :N)
    end

    it 'handles a complex path with obstacles, wrapping, and turning' do
      grid = grid_with_obstacles([[2, 2]])
      rover = rover_facing(:N, grid: grid)

      rover.execute(%w[f f r f f l f])

      expect(rover.x).to eq(1)
      expect(rover.y).to eq(2)
      expect(rover.direction).to eq(:E)
      expect(rover.obstacle_detected?).to be true
    end
  end

  context 'when wrapping around the grid' do
    [
      { direction: :N, edge: 'top',    start: { x: 0, y: 4 }, expected: { x: 0, y: 0 } },
      { direction: :S, edge: 'bottom', start: { x: 0, y: 0 }, expected: { x: 0, y: 4 } },
      { direction: :E, edge: 'right',  start: { x: 4, y: 0 }, expected: { x: 0, y: 0 } },
      { direction: :W, edge: 'left',   start: { x: 0, y: 0 }, expected: { x: 4, y: 0 } }
    ].each do |row|
      it "wraps when moving #{row[:direction]} past the #{row[:edge]} edge" do
        grid = grid_with_obstacles
        rover = rover_facing(row[:direction], x: row[:start][:x], y: row[:start][:y], grid: grid)

        rover.execute(['f'])

        expect(rover).to be_at(x: row[:expected][:x], y: row[:expected][:y], direction: row[:direction])
      end
    end

    it 'wraps when moving backward past an edge' do
      grid = grid_with_obstacles
      rover = rover_facing(:N, grid: grid)

      rover.execute(['b'])

      expect(rover).to be_at(x: 0, y: 4, direction: :N)
    end
  end

  context 'when encountering an obstacle' do
    it 'reports no obstacle detected after normal movement' do
      rover = rover_facing(:N)

      rover.execute(['f'])

      expect(rover.obstacle_detected?).to be false
    end

    it 'stops before an obstacle when moving forward' do
      grid = grid_with_obstacles([[0, 1]], width: 10, height: 10)
      rover = rover_facing(:N, grid: grid)

      rover.execute(['f'])

      expect(rover).to be_obstructed_at(x: 0, y: 0)
    end

    it 'aborts remaining commands after hitting an obstacle' do
      grid = grid_with_obstacles([[0, 2]], width: 10, height: 10)
      rover = rover_facing(:N, grid: grid)

      rover.execute(%w[f f f])

      expect(rover).to be_obstructed_at(x: 0, y: 1)
    end

    it 'stops before an obstacle when moving backward' do
      grid = grid_with_obstacles([[0, 4]], width: 10, height: 10)
      rover = rover_facing(:N, x: 0, y: 5, grid: grid)

      rover.execute(['b'])

      expect(rover).to be_obstructed_at(x: 0, y: 5)
    end

    it 'detects obstacle at a wrapped position' do
      grid = grid_with_obstacles([[0, 0]])
      rover = rover_facing(:N, x: 0, y: 4, grid: grid)

      rover.execute(['f'])

      expect(rover).to be_obstructed_at(x: 0, y: 4)
    end
  end
end
