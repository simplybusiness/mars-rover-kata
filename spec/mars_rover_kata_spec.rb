require './lib/mars_rover'
require './lib/commands'

RSpec.describe 'mars rover kata' do
  describe 'MarsRover' do
    it 'knows its initial starting coordinates of x and y' do
      mars_rover = MarsRover.new(x: 200, y: 400, direction: 'S')

      expect(mars_rover.coordinates).to eq [200, 400]
    end

    it 'knows its compass direction' do
      mars_rover = MarsRover.new(x: 200, y: 400, direction: 'N')

      expect(mars_rover.direction).to eq 'N'
    end
  end

  describe 'Commands' do
    it 'recieves a character array of commands' do
      commands = Commands.new

      result = commands.send(['w', 'w', 's'])

      expect(result).to eq(['w', 'w', 's'])
    end

    it 'implements commands that move the rover forward or backward' do
      mars_rover = MarsRover.new(x: 200, y: 400, direction: "N")
      commands = Commands.new

      commands.send(['w', 'w', 's'], mars_rover)

      expect(mars_rover.coordinates).to eq [200, 450]
    end
  end
end
