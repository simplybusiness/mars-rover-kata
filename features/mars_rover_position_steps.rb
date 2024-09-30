class MarsRover
  def initialize(x , y, direction = 'N')
    @x = x
    @y = y
    @current_direction = direction
  end

  def current_position
    [@x, @y]
  end

  def current_direction
    @current_direction
  end
end 


Given('The Mars Rover is at \({int}, {int}) starting position and facing {direction}') do |int, int2, direction|
  @mars_rover = MarsRover.new(int, int2, direction)
end

When('we ask its current position') do
  @current_position = @mars_rover.current_position
end

When('we ask its current direction') do
  @current_direction = @mars_rover.current_direction
end

Then('we get a signal back that its starting position is \({int}, {int})') do |int, int2|
  expect(@current_position).to eq([int, int2])
end

Then('we also get a signal back about its current direction {direction}') do |direction|
  expect(@current_direction).to eq(direction)
end
