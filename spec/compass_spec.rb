require 'pry'
require_relative '../lib/compass.rb'

describe Compass do
  let(:direction) { "N" }

  it 'has starting direction' do
    expect(compass.direction).to eq "N" 
  end

  it 'goes left' do
    expect(compass.left.direction).to eq "W"
  end

  it 'goes right' do
    expect(compass.right.direction).to eq "E"
  end

end

def compass
  Compass.new(direction)
end
