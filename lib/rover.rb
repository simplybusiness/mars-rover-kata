class Rover
  attr_reader :x, :y, :direction

  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def execute(commands)
    commands.each do |command|
      case command
      when 'f'
        move_forward
      when 'b'
        move_backward
      end
    end
  end

  private

  def move_backward
    case @direction
    when :N then @y -= 1
    when :E then @x -= 1
    when :S then @y += 1
    when :W then @x += 1
    end
  end

  def move_forward
    case @direction
    when :N then @y += 1
    when :E then @x += 1
    when :S then @y -= 1
    when :W then @x -= 1
    end
  end
end
