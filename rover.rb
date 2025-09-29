require_relative "./coordinates"

class Rover
    CARDINAL_DIRECTIONS = ['N', 'S', 'E', 'W']

    attr_reader :x, :y, :direction, :commands

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

        @x = x
        @y = y
        @direction = direction
        @commands = commands
    end

    def current_position
        return [@x, @y]
    end

    def move
        commands.each do |command|
            case command.downcase
            when 'f'
                case @direction
                when 'N'
                    @y += 1
                when 'S'
                    @y -= 1
                when 'E'
                    @x += 1
                when 'W'
                    @x -= 1
                end
            when 'b'
                case @direction
                when 'N'
                    @y -= 1
                when 'S'
                    @y += 1
                when 'E'
                    @x -= 1
                when 'W'
                    @x += 1
                end
            when 'l'
                case @direction
                when 'N'
                    @x -= 1
                when 'S'
                    @x += 1
                when 'E'
                    @y += 1
                when 'W'
                    @y -= 1
                end
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
end