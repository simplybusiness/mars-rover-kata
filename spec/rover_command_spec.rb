class Rover
    def initialize(starting_point = [-1, -1], starting_direction = 'W')
        @current_position = starting_point
        @current_direction = starting_direction
    end

    def current_position
        @current_position
    end

    def current_direction
        @current_direction
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

    it 'knows it current position anywhere' do
        starting_point = [1, 1]
        rover = Rover.new(starting_point)
        expect(rover.current_position). to eq([1, 1])
    end

    it 'knows it current direction' do
        starting_direction = 'N'
        starting_point = [1, 1]
        rover = Rover.new(starting_point, starting_direction)
        expect(rover.current_direction). to eq('N')
    end
end