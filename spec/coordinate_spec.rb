require_relative '../lib/coordinates'

RSpec.describe Coordinates do
  describe ".new" do
    context "when the coordinates is initialized" do
      it 'returns coordinates entity' do
        expect(Coordinates.new).not_to be_nil
      end


    end
  end
end
