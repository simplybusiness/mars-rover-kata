class MarsRover
  def initialize(x , y)
    @x = x
    @y = y
  end

  def current_position
    [@x, @y]
  end

end 

Given('The Mars Rover is at \({int}, {int}) starting position') do |int, int2|
  @mars_rover = MarsRover.new(int, int2)
end

When('we ask its current position') do
  @current_position = @mars_rover.current_position
end

Then('we get a signal back that its starting position is \({int}, {int})') do |int, int2|
  expect(@current_position).to eq([int, int2])
end
    
Then('we also get a signal back about its current direction is \({char})') do |char|
  expect(@current_direction).to eq([char])
end
