class Location
  attr_reader :coordinates, :direction

  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  TURN_RIGHT = TURN_LEFT.invert
  private_constant :TURN_RIGHT

  def self.south_facing(coordinates:)
    new(coordinates: coordinates, direction: 'S')
  end

  def initialize(coordinates:, direction:)
    @coordinates = coordinates
    @direction = direction
  end

  def forwards
    case direction
    when 'N'
      Location.new(
        coordinates: Coordinates.new(x: coordinates.x, y: (coordinates.y + 1)),
        direction: direction
      )
    when 'S'
      Location.new(
        coordinates: Coordinates.new(x: coordinates.x, y: (coordinates.y - 1)),
        direction: direction
      )
    end
  end

  def rotate_left
    Location.new(
      coordinates: coordinates,
      direction: TURN_LEFT[direction]
    )
  end

  def rotate_right
    Location.new(
      coordinates: coordinates,
      direction: TURN_RIGHT[direction]
    )
  end

  def inspect
    "#{coordinates} facing #{direction}"
  end
end
