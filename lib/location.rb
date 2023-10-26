class Location
  attr_reader :coordinates, :direction

  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  def initialize(coordinates:, direction:)
    @coordinates = coordinates
    @direction = direction
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
      direction: TURN_LEFT.invert[direction]
    )
  end

  def inspect
    "#{coordinates} facing #{direction}"
  end
end
