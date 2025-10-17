# frozen_string_literal: true

require_relative '../../src/coordinates'

RSpec.describe Coordinates do
  it 'is initialized to be 0, 0' do
    coords = Coordinates.new

    expect(coords.current_coordinates).to eq([0, 0])
  end
end