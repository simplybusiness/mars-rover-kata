class Rover
    def initialize(starting_point)
    end

    def current_position
        [0,0]
    end
end

RSpec.describe '1 + 1' do
    it 'equals 2' do
        expect(1 + 1).to eq(2)
    end

    it 'knows it current position' do
        starting_point = [0, 0]
        rover = Rover.new(starting_point)
        expect(rover.current_position). to eq([0, 0])
    end

    it 'knows it current direction'
end