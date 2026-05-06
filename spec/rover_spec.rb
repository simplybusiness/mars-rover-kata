require_relative '../lib/rover'
require_relative '../lib/grid'

RSpec.describe Rover do
  def rover_facing(direction, x: 0, y: 0, grid: nil)
    Rover.new(x: x, y: y, direction: direction, grid: grid)
  end

  def grid_with_obstacles(obstacles = [], width: 5, height: 5)
    Grid.new(width: width, height: height, obstacles: obstacles)
  end

  it 'has a starting position and direction' do
    rover = rover_facing(:N)

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end

  it 'receives an empty array of commands' do
    rover = rover_facing(:N)

    rover.execute([])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end

  it 'ignores unrecognized commands' do
    rover = rover_facing(:N)

    rover.execute(%w[x z])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end

  it 'moves forward one step when facing north' do
    rover = rover_facing(:N)

    rover.execute(['f'])

    expected_x_coordinate = 0
    expected_y_coordinate = 1
    expected_direction = :N
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'moves forward multiple steps when facing north' do
    rover = rover_facing(:N)

    rover.execute(%w[f f f])

    expected_x_coordinate = 0
    expected_y_coordinate = 3
    expected_direction = :N
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'moves backward one step when facing north' do
    rover = rover_facing(:N)

    rover.execute(['b'])

    expected_x_coordinate = 0
    expected_y_coordinate = -1
    expected_direction = :N
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'moves forward one step when facing east' do
    rover = rover_facing(:E)

    rover.execute(['f'])

    expected_x_coordinate = 1
    expected_y_coordinate = 0
    expected_direction = :E
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'moves forward one step when facing south' do
    rover = rover_facing(:S)

    rover.execute(['f'])

    expected_x_coordinate = 0
    expected_y_coordinate = -1
    expected_direction = :S
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'moves forward one step when facing west' do
    rover = rover_facing(:W)

    rover.execute(['f'])

    expected_x_coordinate = -1
    expected_y_coordinate = 0
    expected_direction = :W
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'moves backward one step when facing east' do
    rover = rover_facing(:E)

    rover.execute(['b'])

    expected_x_coordinate = -1
    expected_y_coordinate = 0
    expected_direction = :E
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'moves backward one step when facing south' do
    rover = rover_facing(:S)

    rover.execute(['b'])

    expected_x_coordinate = 0
    expected_y_coordinate = 1
    expected_direction = :S
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'moves backward one step when facing west' do
    rover = rover_facing(:W)

    rover.execute(['b'])

    expected_x_coordinate = 1
    expected_y_coordinate = 0
    expected_direction = :W
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'turns right from north to face east' do
    rover = rover_facing(:N)

    rover.execute(['r'])

    expected_x_coordinate = 0
    expected_y_coordinate = 0
    expected_direction = :E
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'turns right from east to face south' do
    rover = rover_facing(:E)

    rover.execute(['r'])

    expected_x_coordinate = 0
    expected_y_coordinate = 0
    expected_direction = :S
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'turns right four times to face north again' do
    rover = rover_facing(:N)

    rover.execute(%w[r r r r])

    expected_x_coordinate = 0
    expected_y_coordinate = 0
    expected_direction = :N
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'turns left from north to face west' do
    rover = rover_facing(:N)

    rover.execute(['l'])

    expected_x_coordinate = 0
    expected_y_coordinate = 0
    expected_direction = :W
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'turns left from south to face east' do
    rover = rover_facing(:S)

    rover.execute(['l'])

    expected_x_coordinate = 0
    expected_y_coordinate = 0
    expected_direction = :E
    expect(rover.x).to eq expected_x_coordinate
    expect(rover.y).to eq expected_y_coordinate
    expect(rover.direction).to eq expected_direction
  end

  it 'executes a complex path with all four commands' do
    rover = rover_facing(:N)

    rover.execute(%w[f f r f f l b])

    expect(rover.x).to eq(2)
    expect(rover.y).to eq(1)
    expect(rover.direction).to eq(:N)
  end

  it 'accepts a grid' do
    grid = grid_with_obstacles([], width: 10, height: 10)
    rover = rover_facing(:N, grid: grid)

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
  end

  it 'wraps when moving north past the top edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:N, x: 0, y: 4, grid: grid)

    rover.execute(['f'])

    expect(rover.y).to eq(0)
    expect(rover.x).to eq(0)
  end

  it 'wraps when moving south past the bottom edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:S, grid: grid)

    rover.execute(['f'])

    expect(rover.y).to eq(4)
  end

  it 'wraps when moving east past the right edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:E, x: 4, grid: grid)

    rover.execute(['f'])

    expect(rover.x).to eq(0)
  end

  it 'wraps when moving west past the left edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:W, grid: grid)

    rover.execute(['f'])

    expect(rover.x).to eq(4)
  end

  it 'wraps when moving backward past an edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:N, grid: grid)

    rover.execute(['b'])

    expect(rover.y).to eq(4)
  end

  it 'reports no obstacle detected after normal movement' do
    rover = rover_facing(:N)

    rover.execute(['f'])

    expect(rover.obstacle_detected?).to be false
  end

  it 'stops before an obstacle when moving forward' do
    grid = grid_with_obstacles([[0, 1]], width: 10, height: 10)
    rover = rover_facing(:N, grid: grid)

    rover.execute(['f'])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.obstacle_detected?).to be true
  end

  it 'aborts remaining commands after hitting an obstacle' do
    grid = grid_with_obstacles([[0, 2]], width: 10, height: 10)
    rover = rover_facing(:N, grid: grid)

    rover.execute(%w[f f f])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(1)
    expect(rover.obstacle_detected?).to be true
  end

  it 'stops before an obstacle when moving backward' do
    grid = grid_with_obstacles([[0, 4]], width: 10, height: 10)
    rover = rover_facing(:N, x: 0, y: 5, grid: grid)

    rover.execute(['b'])

    expect(rover.y).to eq(5)
    expect(rover.obstacle_detected?).to be true
  end

  it 'detects obstacle at a wrapped position' do
    grid = grid_with_obstacles([[0, 0]])
    rover = rover_facing(:N, x: 0, y: 4, grid: grid)

    rover.execute(['f'])

    expect(rover.y).to eq(4)
    expect(rover.obstacle_detected?).to be true
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
