# Req 1: You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
require_relative 'spec_helper'
require_relative '../lib/coordinates'

describe Coordinates do
  describe 'on initialization' do
    subject(:coordinates) { described_class.new(x: 0, y: 1) }

    it 'raises an error when initialized with non-integers as initial position' do
      expect { Coordinates.new(x: 'abc', y: 'def') }.to raise_error BadCoordinatesError
    end

    it 'assigns the intended position' do
      expect(coordinates.x).to eq(0)
      expect(coordinates.y).to eq(1)
    end

    it 'compares two different positions' do
      new_coordinates = Coordinates.new(x: 1, y: 2)
      expect(coordinates == new_coordinates).to eq(false)
    end

    context 'when the new coordinates has been provided' do
      it 'sets new position' do
        new_coordinates = Coordinates.new(x: 1, y: 2)
        expect(coordinates == new_coordinates).to eq(false)
        coordinates.new_position(new_coordinates)
        expect(coordinates == new_coordinates).to eq(true)
      end
    end
  end
end
