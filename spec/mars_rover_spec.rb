RSpec.describe "Mars Rover" do
  class MarsRover
    attr_reader :x, :y, :direction

    def initialize(x, y, direction)
      raise Exception.new('x or y should be integer or float!') if x.is_a?(String) || y.is_a?(String)
      raise Exception.new('direction should be one of N, E, S or W') if ! ['N', 'S', 'W', 'E'].include? direction
      @x = x
      @y = y
      @direction = direction
    end
    def receive(commands)

    end
  end

  describe '#initialize' do
    context 'with valid inputs' do
      let(:mars_rover) {MarsRover.new(0, 0, 'N')}
      it 'sets the x correctly' do
        expect(mars_rover.x).to eq(0)
      end
      it 'sets the y correctly' do
        expect(mars_rover.y).to eq(0)
      end
      it 'sets the direction correctly' do
        expect(mars_rover.direction).to eq('N')
      end
    end

    context 'with invalid inputs' do
      it 'raises an error when x is invalid e.g. out of range' do
        expect{ MarsRover.new('x', 0, 'N') }.to raise_error("x or y should be integer or float!")
      end

      it 'raises an error when y is invalid e.g. out of range' do
        expect { MarsRover.new(1, 'y', 'N') }.to raise_error('x or y should be integer or float!')
      end

      it 'raises an error when direction is invalid incorrect type' do
        expect { MarsRover.new(0, 0, 0) }.to raise_error('direction should be one of N, E, S or W')
      end

      it 'raises an error when the direction is invalid (not any of N, E, S or W)' do
        expect { MarsRover.new(0, 0, 'X') }.to raise_error('direction should be one of N, E, S or W')
      end
    end
  end
  describe 'receive commands' do
    let(:mars_rover) { MarsRover.new(1, 0, 'S') }
    context 'when provided with valid commands with a char array of f, b, l, r' do
      it 'dose not raise errors' do
        commands = ['f', 'b', 'r', 'l']
        expect { mars_rover.receive(commands) }.not_to raise_error
        expect(mars_rover.x).to eq(1)
        expect(mars_rover.y).to eq(0)
        expect(mars_rover.direction).to eq('S')
      end
    end
    context 'when provided with empty commands or invalid commands' do
      example 'when empty commands does not raise errors and stay the same' do
        commands = []
        expect { mars_rover.receive(commands) }.not_to raise_error
        expect(mars_rover.x).to eq(1)
        expect(mars_rover.y).to eq(0)
        expect(mars_rover.direction).to eq('S')
      end
      example 'when all invalid commands does not raise errors and stay the same' do
        commands = ['a', 'c', 't']
        expect { mars_rover.receive(commands) }.not_to raise_error
        expect(mars_rover.x).to eq(1)
        expect(mars_rover.y).to eq(0)
        expect(mars_rover.direction).to eq('S')
      end
      example 'when combined with invalid and valid commands does not raise errors and stay the same' do
        commands = ['f', 'a', 'l']
        expect { mars_rover.receive(commands) }.not_to raise_error
        expect(mars_rover.x).to eq(1)
        expect(mars_rover.y).to eq(0)
        expect(mars_rover.direction).to eq('S')
      end
    end
  end

  describe 'Mars rover moving forwards' do
    example 'moving forwards when facing north' do
      pending('TODO')
      mars_rover = MarsRover.new(0, 0, 'N')

      mars_rover.receive(['f'])

      expect(mars_rover.x).to eq(0)
      expect(mars_rover.y).to eq(1)
      expect(mars_rover.direction).to eq('N')
    end
  end
end
