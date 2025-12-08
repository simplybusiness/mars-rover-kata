# frozen_string_literal: true

require_relative '../../src/coordinates'

RSpec.describe Coordinates do
  it 'is initialized to be 0, 0 by default' do
    coords = Coordinates.new
    expected = Coordinates.new(x: 0, y: 0)
    expect(coords).to eq(expected)
  end

  describe '#equals' do
    it 'correctly compares two different objects with the same coordinates' do
      coords = Coordinates.new(x: 1, y: 1)
      expected = Coordinates.new(x: 1, y: 1)
      expect(coords).to eq(expected)
    end

    it 'returns false when comparing coordinates with different x values' do
      coords1 = Coordinates.new(x: 1, y: 5)
      coords2 = Coordinates.new(x: 2, y: 5)
      expect(coords1).not_to eq(coords2)
    end

    it 'returns false when comparing coordinates with different y values' do
      coords1 = Coordinates.new(x: 5, y: 1)
      coords2 = Coordinates.new(x: 5, y: 2)
      expect(coords1).not_to eq(coords2)
    end

    it 'returns false when comparing with a non-Coordinates object' do
      coords = Coordinates.new(x: 1, y: 1)
      expect(coords).not_to eq([1, 1])
    end

    it 'returns false when comparing with nil' do
      coords = Coordinates.new(x: 1, y: 1)
      expect(coords).not_to eq(nil)
    end

    it 'returns true when comparing negative coordinates' do
      coords1 = Coordinates.new(x: -5, y: -10)
      coords2 = Coordinates.new(x: -5, y: -10)
      expect(coords1).to eq(coords2)
    end

    it 'is reflexive (object equals itself)' do
      coords = Coordinates.new(x: 3, y: 7)
      expect(coords).to eq(coords)
    end

    it 'is symmetric (if a == b then b == a)' do
      coords1 = Coordinates.new(x: 4, y: 8)
      coords2 = Coordinates.new(x: 4, y: 8)
      expect(coords1).to eq(coords2)
      expect(coords2).to eq(coords1)
    end

    it 'is transitive (if a == b and b == c then a == c)' do
      coords1 = Coordinates.new(x: 2, y: 3)
      coords2 = Coordinates.new(x: 2, y: 3)
      coords3 = Coordinates.new(x: 2, y: 3)
      expect(coords1).to eq(coords2)
      expect(coords2).to eq(coords3)
      expect(coords1).to eq(coords3)
    end

    it 'returns true when comparing coordinates with zero values' do
      coords1 = Coordinates.new(x: 0, y: 0)
      coords2 = Coordinates.new(x: 0, y: 0)
      expect(coords1).to eq(coords2)
    end

    it 'returns true when comparing large coordinate values' do
      coords1 = Coordinates.new(x: 1000000, y: 2000000)
      coords2 = Coordinates.new(x: 1000000, y: 2000000)
      expect(coords1).to eq(coords2)
    end

    it 'returns true when comparing mixed positive and negative coordinates' do
      coords1 = Coordinates.new(x: -5, y: 10)
      coords2 = Coordinates.new(x: -5, y: 10)
      expect(coords1).to eq(coords2)
    end

    it 'returns false when comparing with a string' do
      coords = Coordinates.new(x: 1, y: 1)
      expect(coords).not_to eq("1,1")
    end

    it 'returns false when comparing with a hash' do
      coords = Coordinates.new(x: 1, y: 1)
      expect(coords).not_to eq({ x: 1, y: 1 })
    end
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