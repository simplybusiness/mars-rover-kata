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

  describe '#execute' do
    describe 'command parsing' do
      it 'stays put on empty input' do
        rover = rover_facing(:N)

        rover.execute([])

        expect(rover).to be_at(x: 0, y: 0, direction: :N)
      end

      it 'ignores unrecognized commands' do
        rover = rover_facing(:N)

        rover.execute(%w[x z])

        expect(rover).to be_at(x: 0, y: 0, direction: :N)
      end
    end

    describe 'movement' do
      context 'forward' do
        include_examples 'a single-step command', 'f',
                         'facing N' => { start: :N, x: 0,  y: 1,  direction: :N },
                         'facing E' => { start: :E, x: 1,  y: 0,  direction: :E },
                         'facing S' => { start: :S, x: 0,  y: -1, direction: :S },
                         'facing W' => { start: :W, x: -1, y: 0,  direction: :W }

        it 'moves multiple steps when facing north' do
          rover = rover_facing(:N)

          rover.execute(%w[f f f])

          expect(rover).to be_at(x: 0, y: 3, direction: :N)
        end
      end

      context 'backward' do
        include_examples 'a single-step command', 'b',
                         'facing N' => { start: :N, x: 0,  y: -1, direction: :N },
                         'facing E' => { start: :E, x: -1, y: 0,  direction: :E },
                         'facing S' => { start: :S, x: 0,  y: 1,  direction: :S },
                         'facing W' => { start: :W, x: 1,  y: 0,  direction: :W }
      end
    end

    describe 'rotation' do
      context 'right' do
        include_examples 'a single-step command', 'r',
                         'starting from N' => { start: :N, x: 0, y: 0, direction: :E },
                         'starting from E' => { start: :E, x: 0, y: 0, direction: :S }

        it 'returns to facing north after four right turns' do
          rover = rover_facing(:N)

          rover.execute(%w[r r r r])

          expect(rover).to be_at(x: 0, y: 0, direction: :N)
        end
      end

      context 'left' do
        include_examples 'a single-step command', 'l',
                         'starting from N' => { start: :N, x: 0, y: 0, direction: :W },
                         'starting from S' => { start: :S, x: 0, y: 0, direction: :E }
      end
    end

    describe 'grid wrapping' do
      context 'when moving forward off an edge' do
        [
          { direction: :N, edge: 'top',    start: { x: 0, y: 4 }, expected: { x: 0, y: 0 } },
          { direction: :S, edge: 'bottom', start: { x: 0, y: 0 }, expected: { x: 0, y: 4 } },
          { direction: :E, edge: 'right',  start: { x: 4, y: 0 }, expected: { x: 0, y: 0 } },
          { direction: :W, edge: 'left',   start: { x: 0, y: 0 }, expected: { x: 4, y: 0 } }
        ].each do |row|
          it "wraps to the #{row[:edge]} edge moving #{row[:direction]}" do
            grid = grid_with_obstacles
            rover = rover_facing(row[:direction], x: row[:start][:x], y: row[:start][:y], grid: grid)

            rover.execute(['f'])

            expect(rover).to be_at(x: row[:expected][:x], y: row[:expected][:y], direction: row[:direction])
          end
        end
      end

      context 'when moving backward off an edge' do
        it 'wraps to the opposite edge' do
          grid = grid_with_obstacles
          rover = rover_facing(:N, grid: grid)

          rover.execute(['b'])

          expect(rover).to be_at(x: 0, y: 4, direction: :N)
        end
      end
    end

    describe 'obstacle detection' do
      it 'reports no obstacle after a clear move' do
        rover = rover_facing(:N)

        rover.execute(['f'])

        expect(rover.obstacle_detected?).to be false
      end

      context 'when the path is blocked' do
        it 'stops before an obstacle when moving forward' do
          grid = grid_with_obstacles([[0, 1]], width: 10, height: 10)
          rover = rover_facing(:N, grid: grid)

          rover.execute(['f'])

          expect(rover).to be_obstructed_at(x: 0, y: 0)
        end

        it 'stops before an obstacle when moving backward' do
          grid = grid_with_obstacles([[0, 4]], width: 10, height: 10)
          rover = rover_facing(:N, x: 0, y: 5, grid: grid)

          rover.execute(['b'])

          expect(rover).to be_obstructed_at(x: 0, y: 5)
        end

        it 'aborts remaining commands after hitting an obstacle' do
          grid = grid_with_obstacles([[0, 2]], width: 10, height: 10)
          rover = rover_facing(:N, grid: grid)

          rover.execute(%w[f f f])

          expect(rover).to be_obstructed_at(x: 0, y: 1)
        end

        it 'detects an obstacle at a wrapped position' do
          grid = grid_with_obstacles([[0, 0]])
          rover = rover_facing(:N, x: 0, y: 4, grid: grid)

          rover.execute(['f'])

          expect(rover).to be_obstructed_at(x: 0, y: 4)
        end
      end
    end

    describe 'command sequences' do
      it 'executes a path combining moves and turns' do
        rover = rover_facing(:N)

        rover.execute(%w[f f r f f l b])

        expect(rover).to be_at(x: 2, y: 1, direction: :N)
      end

      it 'handles a path with obstacles, wrapping, and turning' do
        grid = grid_with_obstacles([[2, 2]])
        rover = rover_facing(:N, grid: grid)

        rover.execute(%w[f f r f f l f])

        expect(rover).to be_obstructed_at(x: 1, y: 2)
        expect(rover.direction).to eq(:E)
      end
    end
  end
end
