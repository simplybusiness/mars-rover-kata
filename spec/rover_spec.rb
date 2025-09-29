require_relative '../rover'

RSpec.describe Rover do
    # example of a pending test
    it 'knows its starting position'

    it 'has a starting position that is not null' do
        rov = Rover.new
        expect(rov.current_position).not_to be_nil
    end

    it 'can be initialized with custom starting coordinates' do
        rov = Rover.new(x: 3, y: 3)
        expect(rov.current_position).to eq([3, 3])
    end

    it 'raises an argument error when the coordinates passed are not floats' do
        expect { Rover.new(x: 'Z') }.to raise_error(ArgumentError, /Invalid coordinates/)
        expect { Rover.new(y: 'Z') }.to raise_error(ArgumentError, /Invalid coordinates/)
    end

    it 'has a starting direction that is one of N, S, E, W' do
        rov = Rover.new
        valid_directions = ["N", "S", "E", "W"]
        expect(valid_directions).to include(rov.direction)
    end

    it 'can be initialized with all custom directions' do
        rov_s = Rover.new(direction: 'S')
        expect(rov_s.direction).to eq('S')

        rov_e = Rover.new(direction: 'E')
        expect(rov_e.direction).to eq('E')

        rov_w = Rover.new(direction: 'W')
        expect(rov_w.direction).to eq('W')
    end

    it 'raises an argument error when initialized with an invalid direction' do
        expect { Rover.new(direction: 'Z') }.to raise_error(ArgumentError, /Invalid direction/)
    end

    it 'holds the character array of commands' do
        rov = Rover.new(commands: ['f', 'b', 'f', 'b'])
        expect(rov.commands).to eq(['f', 'b', 'f', 'b'])

        expect { Rover.new(commands: [1, 2, 3]) }.to raise_error(ArgumentError, /Commands must be/)
        expect { Rover.new(commands: [1]) }.to raise_error(ArgumentError, /Commands must be/)
        expect { Rover.new(commands: ["A", 23]) }.to raise_error(ArgumentError, /Commands must be/)
        expect { Rover.new(commands: ['A', "ABSDF"]) }.to raise_error(ArgumentError, /Commands must be/)
    end

    it 'moves forward facing North' do
        rov = Rover.new(direction: 'N', commands: ['f'])
        expect(rov.x).to eq(0)
        expect(rov.y).to eq(0)

        rov.move()
        expect(rov.x).to eq(0)
        expect(rov.y).to eq(1)
    end

    it 'moves forward facing South' do
        rov_s = Rover.new(direction: 'S', commands: ['f'])
        expect(rov_s.x).to eq(0)
        expect(rov_s.y).to eq(0)

        rov_s.move()
        expect(rov_s.x).to eq(0)
        expect(rov_s.y).to eq(-1)
    end

    it 'moves forward facing East' do
        rov_e = Rover.new(direction: 'E', commands: ['f'])
        expect(rov_e.x).to eq(0)
        expect(rov_e.y).to eq(0)

        rov_e.move()
        expect(rov_e.x).to eq(1)
        expect(rov_e.y).to eq(0)
    end

    it 'moves forward facing West' do
        rov_w = Rover.new(direction: 'W', commands: ['f'])
        expect(rov_w.current_position).to eq([0, 0])

        rov_w.move()
        expect(rov_w.current_position).to eq([-1, 0])
    end

    it 'moves forward 10 times correctly' do
        rover = Rover.new(direction: 'N', commands: ['f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f'])
        expect(rover.x).to eq(0)
        expect(rover.y).to eq(0)

        rover.move()
        expect(rover.x).to eq(0)
        expect(rover.y).to eq(10)
    end

    it 'moves backward correctly' do
        rov = Rover.new(commands: ['b', 'b', 'b'])
        expect(rov.x).to eq(0)
        expect(rov.y).to eq(0)

        rov.move()
        expect(rov.x).to eq(0)
        expect(rov.y).to eq(-3)

        rov_s = Rover.new(direction: 'S', commands: ['b', 'b', 'b'])
        expect(rov_s.x).to eq(0)
        expect(rov_s.y).to eq(0)

        rov_s.move()
        expect(rov_s.x).to eq(0)
        expect(rov_s.y).to eq(3)

        rov_e = Rover.new(direction: 'E', commands: ['b'])
        expect(rov_e.x).to eq(0)
        expect(rov_e.y).to eq(0)

        rov_e.move()
        expect(rov_e.x).to eq(-1)
        expect(rov_e.y).to eq(0)

        rov_w = Rover.new(direction: 'W', commands: ['b', 'b'])
        expect(rov_w.x).to eq(0)
        expect(rov_w.y).to eq(0)

        rov_w.move()
        expect(rov_w.x).to eq(2)
        expect(rov_w.y).to eq(0)
    end

    it 'can move backwards and forwards in the same command list' do
        rov = Rover.new(commands: ['f', 'f', 'b', 'b', 'b'])
        expect(rov.x).to eq(0)
        expect(rov.y).to eq(0)

        rov.move()
        expect(rov.x).to eq(0)
        expect(rov.y).to eq(-1)
    end

    it 'moves left correctly' do
        rov = Rover.new(commands: ['l', 'l', 'l'])
        expect(rov.x).to eq(0)
        expect(rov.y).to eq(0)

        rov.move()
        expect(rov.x).to eq(-3)
        expect(rov.y).to eq(0)

        rov_s = Rover.new(direction: 'S', commands: ['l', 'l', 'l'])
        expect(rov_s.x).to eq(0)
        expect(rov_s.y).to eq(0)

        rov_s.move()
        expect(rov_s.x).to eq(3)
        expect(rov_s.y).to eq(0)

        rov_e = Rover.new(direction: 'E', commands: ['l'])
        expect(rov_e.x).to eq(0)
        expect(rov_e.y).to eq(0)

        rov_e.move()
        expect(rov_e.x).to eq(0)
        expect(rov_e.y).to eq(1)

        rov_w = Rover.new(direction: 'W', commands: ['l', 'l'])
        expect(rov_w.x).to eq(0)
        expect(rov_w.y).to eq(0)

        rov_w.move()
        expect(rov_w.x).to eq(0)
        expect(rov_w.y).to eq(-2)
    end

    it 'moves right correctly' do
        rov = Rover.new(commands: ['r', 'r', 'r'])
        expect(rov.x).to eq(0)
        expect(rov.y).to eq(0)

        rov.move()
        expect(rov.x).to eq(3)
        expect(rov.y).to eq(0)

        rov_s = Rover.new(direction: 'S', commands: ['r', 'r', 'r'])
        expect(rov_s.x).to eq(0)
        expect(rov_s.y).to eq(0)

        rov_s.move()
        expect(rov_s.x).to eq(-3)
        expect(rov_s.y).to eq(0)

        rov_e = Rover.new(direction: 'E', commands: ['r'])
        expect(rov_e.x).to eq(0)
        expect(rov_e.y).to eq(0)

        rov_e.move()
        expect(rov_e.x).to eq(0)
        expect(rov_e.y).to eq(-1)

        rov_w = Rover.new(direction: 'W', commands: ['r', 'r'])
        expect(rov_w.x).to eq(0)
        expect(rov_w.y).to eq(0)

        rov_w.move()
        expect(rov_w.x).to eq(0)
        expect(rov_w.y).to eq(2)
    end

    it 'can move all directions in the same command list' do
        rov = Rover.new(commands: ['f', 'f', 'b', 'r', 'l', 'r'])
        expect(rov.x).to eq(0)
        expect(rov.y).to eq(0)

        rov.move()
        expect(rov.x).to eq(1)
        expect(rov.y).to eq(1)
    end
end
