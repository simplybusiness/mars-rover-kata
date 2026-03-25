require_relative '../lib/grid'

RSpec.describe Grid do
  it 'has a width and height' do
    grid = Grid.new(width: 10, height: 10)

    expect(grid.width).to eq(10)
    expect(grid.height).to eq(10)
  end
end
