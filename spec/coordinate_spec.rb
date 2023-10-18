require_relative '../lib/coordinates'

RSpec.describe Coordinates do
  describe ".new" do
    context "when the coordinates is initialized" do
      it 'returns coordinates entity' do
        coordinates = Coordinates.new(x: 1, y: 1)
        expect(coordinates).not_to be_nil
      end

      it 'has an x position' do
        coordinates = Coordinates.new(x: 1, y: 1)
        expect(coordinates.x_pos).to eq(1)
      end

      it 'has an y position' do
        coordinates = Coordinates.new(x: 1, y: 1)
        expect(coordinates.y_pos).to eq(1)
      end
    end
  end
end
