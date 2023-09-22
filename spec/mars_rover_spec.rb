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
    context 'when provided with valid commands with a char array of f, b, l, r' do
      it 'dose not raise errors'
    end
    context 'when provided with invalid commands' do
      it 'raises an error'
    end
    context 'when provided with empty array' do
      it 'does not raise errors and stay the same'
    end
  end
end
