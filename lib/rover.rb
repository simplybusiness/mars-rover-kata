require 'coordinates'
require 'pry-byebug'

class Rover
    attr_reader :position
    attr_reader :direction

    MOVE_COMMANDS = ['f', 'b']
    TURN_COMMANDS = ['r', 'l']
    COORDINATES = ['N','E','S','W']

    def initialize(position, direction)
        raise ArgumentError.new('Position should be a Coordinate data type') unless position.is_a?(Coordinates)
        raise ArgumentError.new('Direction is not valid, use one of (N,S,E,W)') unless COORDINATES.include?(direction)

        @position = position
        @direction = direction
    end

    def execute(commands) 
        raise ArgumentError.new("Commands should be of Char Array or String format") unless 
        ((commands.is_a? Array) || (commands.is_a? String))

        for i in 0...commands.length do
            next unless (MOVE_COMMANDS.include? commands[i]) || (TURN_COMMANDS.include? commands[i])

            move(commands[i]) if MOVE_COMMANDS.include? commands[i] 
            turn(commands[i]) if TURN_COMMANDS.include? commands[i]  
        end
    end

    def move(command)
        case @direction
        when 'N'
            @position.y += 1 if command == 'f'
            @position.y -= 1 if command == 'b'
        when 'S'
            @position.y -= 1 if command == 'f'
            @position.y += 1 if command == 'b'
        when 'W'
            @position.x -= 1 if command == 'f'
            @position.x += 1 if command == 'b'
        when 'E'
            @position.x += 1 if command == 'f'
            @position.x -= 1 if command == 'b'
        end
    end

    def turn(command)
        case @direction
        when 'N'
            @direction = 'W' if command == 'l'
            @direction = 'E' if command == 'r'
        when 'S'
        when 'W'
        when 'E'
        end
    end
end
