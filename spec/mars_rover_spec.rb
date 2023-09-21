RSpec.describe "Mars Rover" do
  class MarsRover
    attr_reader :x, :y, :direction

    def initialize(x, y, direction)
      raise Exception.new('x should be integer or float!') if x.is_a?(String)
      @x = x
      @y = y
      @direction = direction
    end
  end

  describe '#initialize' do
    context 'with valid inputs' do
      # TO_DO: move the creation of instance out side of it block
      it 'sets the x correctly' do
        mars_rover = MarsRover.new(0, 0, 'N')
        expect(mars_rover.x).to eq(0)
      end
      it 'sets the y correctly' do
        mars_rover = MarsRover.new(0, 0,'N')

        expect(mars_rover.y).to eq(0)
      end
      it 'sets the direction correctly' do
        mars_rover = MarsRover.new(0,0, 'N')
        expect(mars_rover.direction).to eq('N')
      end
    end

    context 'with invalid inputs' do
      it 'raises an error when x is invalid e.g. out of range' do
        expect{ MarsRover.new('x', 0, 'N') }.to raise_error("x should be integer or float!")
      end

      it 'raises an error when y is invalid e.g. out of range' do
        pending('TODO')
        expect { MarsRover.new(1, 'y', 'N') }.to raise_error('y should be an integer or float!')
      end

      it 'raises an error when direction is invalid (not any of N, E, S, W)'
    end
  end
end
