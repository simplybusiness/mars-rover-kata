require_relative '../lib/mars_rover.rb'

describe MarsRover do
  it 'says hello' do
    expect(described_class.new.hello).to eq "hello"
  end
end
