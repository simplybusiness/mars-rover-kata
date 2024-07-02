class Rover
  attr_reader :coordinates, :direction

  def initialize(x, y, direction = 'N')
    raise StandardError unless ['N', 'S', 'E', 'W'].include?direction

    @coordinates = [x, y]
    @direction = direction
  end

  def inspect
    "Rover facing direction: #{@direction } and the coordinates: #{@coordinates}"
  end

  def commands(commands)
    if  commands.include?'f'
      direction = @direction
      y_coord = @coordinates[1].to_i + 1
    end

    [direction, @coordinates[0], y_coord]
  end
end
