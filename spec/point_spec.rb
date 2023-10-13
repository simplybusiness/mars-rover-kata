require_relative '../lib/point'

describe Point do

  it 'returns a co-ordinate' do
    point =  Point.new(0, 0)

    expect(point.coordinates).to eq(([0, 0]))
  end

end


