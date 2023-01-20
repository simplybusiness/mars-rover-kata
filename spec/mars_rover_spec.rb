require 'rspec'
# require_relative '../mars_rover'
class MarsRover
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def position
    {x: @x, y: @y}
  end

  def execute(commands)
    commands.each do |command|
      case @direction
      when 'N'
        @y += { f: 1, b: -1 }[command.to_sym]
      when 'S'
        @y += { f: -1, b: 1 }[command.to_sym]
      when 'E'
        @x += { f: 1, b: -1 }[command.to_sym]
      when 'W'
        @x += { f: -1, b: 1 }[command.to_sym]
      else
      end
    end
    true
  end
end

RSpec.describe MarsRover do
  let(:rover) {MarsRover.new(0,0, 'N')}
  let(:commands) {"fff"}
  let(:complex_command) {"flfrb"}

  it 'knows its position on the planet' do
    mars_rover = MarsRover.new(0, 0, 'N')
    expect(mars_rover.position).to eq({x: 0, y: 0})
  end

  it 'knows its position when landing at 1,1 on the planet' do
    mars_rover = MarsRover.new(1, 1, 'N')
    expect(mars_rover.position).to eq({x: 1, y: 1})
  end

  it 'knows the direction its facing' do
    mars_rover = MarsRover.new(0, 0, 'N')
    expect(mars_rover.direction).to eq('N')
  end

  it 'knows the direction its facing when it lands facing south' do
    mars_rover = MarsRover.new(0, 0, 'S')
    expect(mars_rover.direction).to eq('S')
  end

  it 'can receive an array of commands' do 
    mars_rover = MarsRover.new(0, 0, 'S')
    expect(mars_rover.execute(['f', 'b', 'f'])).to eq(true)
  end

  context 'when facing north' do
    it 'Goes north 1 step when receiving a forward command' do
      mars_rover = MarsRover.new(0, 0, 'N')
      mars_rover.execute(['f'])
      expect(mars_rover.position).to eq({x: 0, y: 1})
    end
    it 'Goes south 1 step when receiving a backwards command' do
      mars_rover = MarsRover.new(0, 0, 'N')
      mars_rover.execute(['b'])
      expect(mars_rover.position).to eq({x: 0, y: -1})
    end
  end
  context 'when facing South' do 
    it 'Goes south 1 step when receivng a forward command' do
      mars_rover = MarsRover.new(0, 0, 'S')
      mars_rover.execute(['f'])
      expect(mars_rover.position).to eq({x: 0, y: -1})
    end
    it 'Goes north 1 step when receivng a backward command' do
      mars_rover = MarsRover.new(0, 0, 'S')
      mars_rover.execute(['b'])
      expect(mars_rover.position).to eq({x: 0, y: 1})
    end
  end
  context 'when facing East' do
    it 'Goes forward 1 step east when receiving a forward command' do
      mars_rover = MarsRover.new(0, 0, 'E')
      mars_rover.execute(['f'])
      expect(mars_rover.position).to eq({x: 1, y: 0})
    end
    it 'Goes 1 step west when receiving a backward command' do
      mars_rover = MarsRover.new(0, 0, 'E')
      mars_rover.execute(['b'])
      expect(mars_rover.position).to eq({x: -1, y: 0})
    end
  end
  context 'When facing West' do
    it 'Goes 1 step west when receiving a forward command' do
      mars_rover = MarsRover.new(0, 0, 'W')
      mars_rover.execute(['f'])
      expect(mars_rover.position).to eq({x: -1, y: 0})
    end
    it 'Goes 1 step east when receiving a backward command' do
      mars_rover = MarsRover.new(0, 0, 'W')
      mars_rover.execute(['b'])
      expect(mars_rover.position).to eq({x: 1, y: 0})
    end
  end

  # if(command == 'b')
  #   @x = @x - 1
  # end
  # {
  #   N: {
  #     f: {
  #       y: 1
  #     }
  #     b: {
  #       y: -1
  #     }
  #   }
  #   S: {
  #     f: {
  #       y: -1
  #     }
  #     b: {
  #       y: 1
  #     }
  #   }
  # }

  # describe 'x' do
  #   it 'returns x' do
  #     expect(rover.x).to eq(2)
  #   end
  # end
  # describe 'y' do
  #   it 'returns y' do
  #     expect(rover.y).to eq(0)
  #   end
  # end
  # describe 'orientation' do
  #   it 'returns North' do
  #     expect(rover.orientation).to eq("N")
  #   end
  # end
  # describe 'execute' do 
  #   it 'moves the rover forward by one space' do
  #     rover.execute("f")
  #     expect(rover.y).to eq(1)
  #   end
  #   it 'moves the rover backwards by one space' do
  #     rover.execute("b")
  #     expect(rover.y).to eq(-1)
  #   end
  #   it 'process commands' do
  #     series_of_commands = rover.process(commands)
  #     expect(series_of_commands).to eq(["f","f","f"])
  #   end
  #   it 'moves the rover forward by three steps' do
  #     rover.execute(commands)
  #     expect(rover.y).to eq(3)
  #   end
  #   it 'rotates right' do
  #     rover.execute('r')
  #     expect(rover.orientation).to eq("E")
  #   end
  #   it 'rotates left' do
  #     rover.execute('l')
  #     expect(rover.orientation).to eq("W")
  #   end
  #   it 'can process both move;ent and rotation' do
  #     rover.execute(complex_command)
  #     expect(rover.y).to eq(1)
  #     expect(rover.x).to eq(0)
  #     expect(rover.orientation).to eq("N")
  #   end
  # end
end
