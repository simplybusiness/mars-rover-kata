require_relative 'spec_helper'

describe Direction do
  it 'has an initial direction' do
    facing_direction = 'N'
    expect(described_class.new(facing_direction: facing_direction).facing_direction).to eq facing_direction
  end
end
