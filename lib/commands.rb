class Commands
  def initialize(mars_rover = nil)
    @mars_rover = mars_rover
  end

  def send(commands)
    return commands if @mars_rover.nil?

    @mars_rover.move(commands)
  end
end
