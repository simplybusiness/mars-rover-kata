# frozen_string_literal: true

require_relative '../../src/coordinates'

RSpec.describe Coordinates do
  it 'is initialized to be 0, 0' do
    coords = Coordinates.new

    expect(coords.current_coordinates).to eq([0, 0])
  end

  it 'can be initialized to different coordinates' do
    coords = Coordinates.new(x: 1, y: 1)

    expect(coords.current_coordinates).to eq([1, 1])
  end

  describe '#change_x' do
    it 'adds 1 to the x if increase is true' do
      coords = Coordinates.new

      expect { coords.change_x }.to change(coords, :current_coordinates).from([0, 0]).to([1, 0])
    end

    it 'subtracts 1 to the x if increase is false' do
      coords = Coordinates.new

      expect { coords.change_x(increase: false) }.to change(coords, :current_coordinates).from([0, 0]).to([-1, 0])
    end
  end

  describe '#change_y' do
    it 'adds 1 to the y if increase is true' do
      coords = Coordinates.new

      expect { coords.change_y }.to change(coords, :current_coordinates).from([0, 0]).to([0, 1])
    end

    it 'subtracts 1 to the y if increase is false' do
      coords = Coordinates.new

      expect { coords.change_y(increase: false) }.to change(coords, :current_coordinates).from([0, 0]).to([0, -1])
    end
  end
end