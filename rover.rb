require_relative "./coordinates"

class Rover
    CARDINAL_DIRECTIONS = ['N', 'S', 'E', 'W']

    attr_reader :direction, :commands

    def initialize(x: 0, y: 0, direction: 'N', commands: [])

        # coords are numbers
        unless x.is_a?(Numeric) && y.is_a?(Numeric)
            raise ArgumentError, 'Invalid coordinates, must be numbers'
        end

        # the direction is valid
        unless CARDINAL_DIRECTIONS.include?(direction)
            raise ArgumentError, "Invalid direction, must be one of #{CARDINAL_DIRECTIONS.join(', ')}"
        end

        # the commands are an array of characters
        unless commands.is_a?(Array) && commands.all? { |c| c.is_a?(String) && c.length == 1 }
            raise ArgumentError, 'Commands must be an array of characters'
        end

        @direction = direction
        @commands = commands
        @coordinates = Coordinates.new(x: x, y: y)
    end

    def current_position
        return @coordinates.current_coordinates
    end

    def move
        commands.each do |command|
            case command.downcase
            when 'f'
                move_forward
            when 'b'
                move_backwards
            when 'l'
                turn_left
            when 'r'
                case @direction
                when 'N'
                    @x += 1
                when 'S'
                    @x -= 1
                when 'E'
                    @y -= 1
                when 'W'
                    @y += 1
                end
            end
        end
    end

    def move_forward
        case @direction
        when 'N'
            @coordinates.y += 1
        when 'S'
            @coordinates.y -= 1
        when 'E'
            @coordinates.x += 1
        when 'W'
            @coordinates.x -= 1
        end
    end

    def move_backwards
        case @direction
        when 'N'
            @coordinates.y -= 1
        when 'S'
            @coordinates.y += 1
        when 'E'
            @coordinates.x -= 1
        when 'W'
            @coordinates.x += 1
        end
    end

    def turn_left
        case @direction
        when 'N'
            @direction = 'W'
        when 'E'
            @direction = 'N'
        when 'S'
            @direction = 'E'
        when 'W'
            @direction = 'S'
        end
    end
end