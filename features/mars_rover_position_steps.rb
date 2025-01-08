require_relative '../lib/mars_rover'
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

Then('it moves forward to new position \({int},{int},{direction})') do |int, int2,direction|
  message = @mars_rover.execute(["f"])
  expect(message).to eq("#{int},#{int2},#{direction}")
end

Then('it moves forward to new position \({int},{int}) still facing East') do |int, int2|
  message = @mars_rover.execute(["f"])
  direction = "E"
  expect(message).to eq("#{int},#{int2},#{direction}")
end

Then('it moves forward to new position \({int},{int}) still facing South') do |int, int2|
  message = @mars_rover.execute(["f"])
  direction = "S"
  expect(message).to eq("#{int},#{int2},#{direction}")
end


