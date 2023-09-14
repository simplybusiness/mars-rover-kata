RSpec.describe "Mars Rover" do
  class MarsRover
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end
  end
  it 'has an initial starting point (x, y)'

  it 'has a direction (N, E, S, W)'

  describe '#initialize' do
    context 'with valid inputs' do
      # TO_DO: move the creation of instance out side of it block
      it 'sets the x correctly' do
        mars_rover = MarsRover.new(0, 0)
        expect(mars_rover.x).to eq(0)
      end
      it 'sets the y correctly' do
        mars_rover = MarsRover.new(0, 0)

        expect(mars_rover.y).to eq(0)
      end
      it 'sets the direction correctly'
    end

    context 'with invalid inputs' do
      it 'raises an error when x is invalid e.g. out of range'
      it 'raises an error when y is invalid e.g. out of range'
      it 'raises an error when direction is invalid (not any of N, E, S, W)'
    end
  end
end
