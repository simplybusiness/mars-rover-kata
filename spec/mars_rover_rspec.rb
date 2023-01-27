class MarsRover

  attr_reader :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def position
    [@x, @y]
  end

  def receives_commands(commands)
    for command in commands
      case command
      when 'f'
        move_forward
      when 'b'
        move_backward
      when 'l'
        turn_left
      when 'r'
        turn_right
      end
    end
  end

  LEFT_TURNS = {
    'N' => 'W',
    'W' => 'S',
    'S' => 'E',
    'E' => 'N'
  }

  def turn_right
    @direction = LEFT_TURNS.invert[direction]
  end

  def turn_left
    @direction = LEFT_TURNS[direction]
  end

  def move(offset)
    case direction
    when 'N'
      @y -= offset
    when 'W'
      @x += offset
    when 'E'
      @x -= offset
    when 'S'
      @y += offset
    end
  end

  def move_backward
    move(1)
  end

  def move_forward
    move(-1)
  end

end

describe MarsRover do
  it 'knows position and direction' do
    rover = MarsRover.new(1, 1, 'N')

    expect(rover.position).to eq([1, 1])
    expect(rover.direction).to eq('N')
  end

  it 'receives commands' do
    rover = MarsRover.new(1, 1, 'N')

    expect(rover.respond_to? :receives_commands).to eq(true)

    rover.receives_commands(['N', 'S'])
  end

  it 'moves forward' do
    rover = MarsRover.new(1, 1, 'N')
    rover.receives_commands(['f'])
    expect(rover.position).to eq([1, 2])

    rover = MarsRover.new(5, 13, 'W')
    rover.receives_commands(['f'])
    expect(rover.position).to eq([4, 13])

    rover = MarsRover.new(6, 1, 'E')
    rover.receives_commands(['f'])
    expect(rover.position).to eq([7, 1])

    rover = MarsRover.new(3, 2, 'S')
    rover.receives_commands(['f'])
    expect(rover.position).to eq([3, 1])
  end

  it 'moves backward' do
    rover = MarsRover.new(1, 1, 'N')
    rover.receives_commands(['b'])
    expect(rover.position).to eq([1, 0])

    rover = MarsRover.new(5, 13, 'W')
    rover.receives_commands(['b'])
    expect(rover.position).to eq([6, 13])

    rover = MarsRover.new(6, 1, 'E')
    rover.receives_commands(['b'])
    expect(rover.position).to eq([5, 1])

    rover = MarsRover.new(3, 2, 'S')
    rover.receives_commands(['b'])
    expect(rover.position).to eq([3, 3])
  end

  it 'moves two spots' do
    rover = MarsRover.new(1, 1, 'N')
    rover.receives_commands(['f', 'f'])
    expect(rover.position).to eq([1, 3])

    rover = MarsRover.new(1, 1, 'N')
    rover.receives_commands(['f', 'b'])
    expect(rover.position).to eq([1, 1])
  end

  it 'can turn left' do
    rover = MarsRover.new(1, 1, 'N')
    rover.receives_commands(['l'])
    expect(rover.position).to eq([1, 1])
    expect(rover.direction).to eq('W')

    rover = MarsRover.new(1, 1, 'S')
    rover.receives_commands(['l'])
    expect(rover.position).to eq([1, 1])
    expect(rover.direction).to eq('E')
  end

  it 'can turn right' do
    rover = MarsRover.new(1, 1, 'N')
    rover.receives_commands(['r'])
    expect(rover.position).to eq([1, 1])
    expect(rover.direction).to eq('E')

    rover = MarsRover.new(1, 1, 'S')
    rover.receives_commands(['r'])
    expect(rover.position).to eq([1, 1])
    expect(rover.direction).to eq('W')
  end

  it 'takes multiple commands' do
    rover = MarsRover.new(1, 1, 'N')
    rover.receives_commands(['r', 'f'])
    expect(rover.position).to eq([2, 1])
    expect(rover.direction).to eq('E')
  end

end
