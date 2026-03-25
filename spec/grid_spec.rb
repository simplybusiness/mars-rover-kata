require_relative '../lib/grid'

RSpec.describe Grid do
  it 'has a width and height' do
    grid = Grid.new(width: 10, height: 10)

    expect(grid.width).to eq(10)
    expect(grid.height).to eq(10)
  end

  it 'wraps x-coordinate when exceeding width' do
    grid = Grid.new(width: 5, height: 5)

    expect(grid.wrap_x(5)).to eq(0)
  end

  it 'wraps x-coordinate when going below zero' do
    grid = Grid.new(width: 5, height: 5)

    expect(grid.wrap_x(-1)).to eq(4)
  end
end
