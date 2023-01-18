class Commands
  def send(commands, mars_rover = nil)
    return commands if mars_rover.nil?

    mars_rover.move(commands)
  end
end
