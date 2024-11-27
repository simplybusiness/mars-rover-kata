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

Given('The Mars Rover receives a set of commands') do
  @mars_rover=MarsRover.new(0,0,'N')
  @message = @mars_rover.execute([])
end

Then ('it responds with a success message') do 
 expect(@message).to eq("0,0,N")
end
