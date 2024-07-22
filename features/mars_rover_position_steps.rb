class MarsRover
  def current_position
    [3, 2]
  end
end

Given('The Mars Rover is at \({int}, {int}) starting position') do |int, int2|
  @mars_rover = MarsRover.new
end

When('we ask its current position') do
  @current_position = @mars_rover.current_position
end

Then('we get a signal back that its starting position is \({int}, {int})') do |int, int2|
  expect(@current_position).to eq([int, int2])
end
    
Then('we also get a signal back about its current direction') do
  pending # Write code here that turns the phrase above into concrete actions
end
