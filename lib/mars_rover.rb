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
      else
        rotate(command)
      end
    end
  end

  private

  def rotate(command)
    rotations = {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'
    }

    case command
    when 'r'      
      @direction = rotations[@direction]
    when 'l'
      @direction = rotations.invert[@direction]
    end
  end

  

  def rotate_left
    rotations = {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'
    }.invert

    @direction = rotations[@direction]
  end
end
