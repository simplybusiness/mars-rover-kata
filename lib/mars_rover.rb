class MarsRover
  attr_accessor :x, :y, :direction, :coordinates

  def initialize(x: 0, y: 0, direction: 'N', coordinates: {x: x, y: y})
    @x = x
    @y = y
    @direction = direction
    @coordinates = coordinates
  end

  def execute(commands)
    displacement_table = {
      'N' => {dx: 0, dy: 1},
      'E' => {dx: 1, dy: 0},
      'S' => {dx: 0, dy: -1},
      'W' => {dx: -1, dy: 0}
    }

    dx, dy = displacement_table[@direction].values

    commands.each do |command|
      case command
      when 'f'
        @x += dx
        @y += dy
      when 'b'
        @x -= dx
        @y -= dy
      when 'r'
        rotate_right(command)
      when 'l'
        rotate_left(command)
      end
    end
  end

  private

  def rotate_right(command)
    rotations = {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'
    }
    
    @direction = rotations[@direction]
  end

  def rotate_left(command)
    rotations = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E'
    }
    @direction = rotations[@direction]
  end
end
