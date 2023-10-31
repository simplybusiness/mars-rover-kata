class Map
  def initialize(x_domain:, y_domain:, obstacles: [])
    @x_domain = x_domain
    @y_domain = y_domain
  end

  def next_location_forwards(location:)
    case location.direction
    when 'N'
      corrected_for_north_pole(location.forwards)
    when 'E'
      if at_right_hand_edge?(location.coordinates)
        Location.new(
          coordinates: Coordinates.new(x: @x_domain.begin, y: location.coordinates.y),
          direction: location.direction
        )
      else
        location.forwards
      end
    when 'S'
      corrected_for_south_pole(location.forwards)
    when 'W'
      next_x = at_left_hand_edge?(location.coordinates) ? @x_domain.end : location.coordinates.x - 1
      Location.new(
        coordinates: Coordinates.new(x: next_x, y: location.coordinates.y),
        direction: location.direction
      )
    end
  end

  def next_location_backwards(location:)
    case location.direction
    when 'N'
      next_y = at_south_pole?(location.coordinates) ? @y_domain.end : location.coordinates.y - 1
      Location.new(
        coordinates: Coordinates.new(x: location.coordinates.x, y: next_y),
        direction: location.direction
      )
    when 'E'
      next_x = at_left_hand_edge?(location.coordinates) ? @x_domain.end : location.coordinates.x - 1
      Location.new(
        coordinates: Coordinates.new(x: next_x, y: location.coordinates.y),
        direction: location.direction
      )
    when 'S'
      next_y = at_north_pole?(location.coordinates) ? @y_domain.begin : location.coordinates.y + 1
      Location.new(
        coordinates: Coordinates.new(x: location.coordinates.x, y: next_y),
        direction: location.direction
      )
    when 'W'
      next_x = at_right_hand_edge?(location.coordinates) ? @x_domain.begin : location.coordinates.x + 1
      Location.new(
        coordinates: Coordinates.new(x: next_x, y: location.coordinates.y),
        direction: location.direction
      )
    end
  end

  private

  def corrected_for_south_pole(location)
    if at_south_pole? location.coordinates
      Location.new(coordinates: Coordinates.new(x: 18, y: -8), direction: 'N')
    else
      location
    end
  end

  def corrected_for_north_pole(location)
    if at_north_pole? location.coordinates
      Location.south_facing(coordinates: Coordinates.new(x: location.coordinates.x + 18, y: 8))
    else
      location
    end
  end

  def at_north_pole?(current_position)
    current_position.y == @y_domain.end
  end

  def at_south_pole?(current_position)
    current_position.y == @y_domain.begin
  end

  def at_left_hand_edge?(current_position)
    current_position.x == @x_domain.begin
  end

  def at_right_hand_edge?(position)
    position.x == @x_domain.end
  end
end
