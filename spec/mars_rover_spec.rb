RSpec.describe "Mars Rover" do

  it 'has an initial starting point (x, y)'

  it 'has a direction (N, E, S, W)'

  describe '#initialize' do
    context 'with valid inputs' do
      it 'sets the x correctly'
      it 'sets the y correctly'
      it 'sets the direction correctly'
    end

    context 'with invalid inputs' do
      it 'raises an error when x is invalid e.g. out of range'
      it 'raises an error when y is invalid e.g. out of range'
      it 'raises an error when direction is invalid (not any of N, E, S, W)'
    end
  end
end
