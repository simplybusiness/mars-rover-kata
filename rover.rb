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
    if @direction  == 'N'
      y_coord = @coordinates[1].to_i + 1
      @coordinates = [@coordinates[0], y_coord]
    else
      x_coord = @coordinates[0].to_i + 1
      @coordinates = [x_coord, @coordinates[1]]
    end

    [@direction] + @coordinates
  end
end
