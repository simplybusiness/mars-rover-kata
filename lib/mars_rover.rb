require 'coordinates'
require 'pry-byebug'

class MarsRover
    attr_reader :position
    attr_reader :direction
    
    MOVE_COMMANDS = ['f', 'b']
    TURN_COMMANDS = ['r', 'l']

    def initialize(starting_point, direction)
        raise ArgumentError.new('starting_point should be a Coordinate data type') unless starting_point.is_a?(Coordinates)
        raise ArgumentError.new('Direction is not valid, use one of (N,S,E,W)') unless ['N','E','S','W'].include?(direction)

        @position = starting_point
        @direction = direction
    end

    def consume(commands) 
        raise ArgumentError.new("Commands should be of Char Array or String format") unless 
        ((commands.is_a? Array) || (commands.is_a? String))

        for i in 0...commands.length do
            raise ArgumentError.new("Command <#{commands[i]}> does not exist") unless 
            (MOVE_COMMANDS.include? commands[i]) || (TURN_COMMANDS.include? commands[i])
        end
    end

    def move(command)
    end

    # def turn(command)
    # end
end
