RSpec.describe "2 + 2" do
  describe '#initialize' do
    context 'with valid inputs' do
      it 'sets the x correctly'
      it 'sets the y correctly'
      it 'sets the direction correctly'
    end

    context 'with invalid inputs' do
      it 'raises an error when x is invalid'
      it 'raises an error when y is invalid'
      it 'raises an error when direction is invalid'
    end
  end
  describe '#receives command list' do
    context 'receives valid command list' do
      it 'receives empty list and rover stays at the same position'
      it 'receives with a list of characters in (f, b, l, r)'
    end

    context 'receive invalid command list' do
      it 'raises an error when command list contain invalid character(s)'
    end
  end
end
