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
    it 'returns a new object with x increased by 1' do
      original_coords = Coordinates.new(x: 5, y: 10)

      new_coords = original_coords.change_x(increase: true)

      expected = Coordinates.new(x: 6, y: 10)
      expect(new_coords).to eq(expected)
    end

    it 'returns a new object with x decreased by 1' do
      original_coords = Coordinates.new(x: 5, y: 10)
      new_coords = original_coords.change_x(increase: false)

      expected = Coordinates.new(x: 4, y: 10)
      expect(new_coords).to eq(expected)
    end
  end

  describe '#change_y' do
    it 'returns a new object with y increased by 1' do
      original_coords = Coordinates.new(x: 5, y: 10)
      new_coords = original_coords.change_y(increase: true)

      expected = Coordinates.new(x: 5, y: 11)
      expect(new_coords).to eq(expected)
    end

    it 'returns a new object with y decreased by 1' do
      original_coords = Coordinates.new(x: 5, y: 10)
      new_coords = original_coords.change_y(increase: false)

      expected = Coordinates.new(x: 5, y: 9)
      expect(new_coords).to eq(expected)
    end
  end
end