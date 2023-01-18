require_relative 'spec_helper'

describe MarsRover do
  it 'says hello' do
    expect(described_class.new.hello).to eq "hello"
  end
end
