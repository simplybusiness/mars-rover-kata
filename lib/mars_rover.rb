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
        move_sideways(command)
      when 'l'
        move_sideways(command)
      end
    end
  end

  private

  def move_sideways(command)
    if @direction == 'N' 
      command == 'r' ? @x += 1 : @x -= 1
    elsif @direction == 'E'
      command == 'r' ? @y -= 1 : @y += 1
    elsif @direction == 'S'
      command == 'r' ? @x -= 1 : @x += 1
    elsif @direction == 'W'
      command == 'r' ? @y += 1 : @y -= 1
    end
  end
end
