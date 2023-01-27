require 'ostruct'

class Command

    def self.step_forward(state)
        case state.direction
        when "N"
            OpenStruct.new(x: state.x, y: state.y + 1, direction: state.direction)
        when "S"
            OpenStruct.new(x: state.x, y: state.y - 1, direction: state.direction)
        when "E"
            OpenStruct.new(x: state.x + 1, y: state.y, direction: state.direction)
        when "W"
            OpenStruct.new(x: state.x - 1, y: state.y, direction: state.direction)
        end
    end

    def self.step_backward(state)
        case state.direction
        when "N"
            OpenStruct.new(x: state.x, y: state.y - 1, direction: state.direction)
        when "S"
            OpenStruct.new(x: state.x, y: state.y + 1, direction: state.direction)
        when "E"
            OpenStruct.new(x: state.x - 1, y: state.y, direction: state.direction)
        when "W"
            OpenStruct.new(x: state.x + 1, y: state.y, direction: state.direction)
        end
    end

    def self.rotate_left(state)
        case state.direction
        when "N"
            OpenStruct.new(x: state.x, y: state.y, direction: "W")
        when "W"
            OpenStruct.new(x: state.x, y: state.y, direction: "S")
        when "S"
            OpenStruct.new(x: state.x, y: state.y, direction: "E")
        when "E"
            OpenStruct.new(x: state.x, y: state.y, direction: "N")
        end
    end

    def self.rotate_right(state)
        case state.direction
        when "N"
            OpenStruct.new(x: state.x, y: state.y, direction: "E")
        when "E"
            OpenStruct.new(x: state.x, y: state.y, direction: "S")
        when "S"
            OpenStruct.new(x: state.x, y: state.y, direction: "W")
        when "W"
            OpenStruct.new(x: state.x, y: state.y, direction: "N")
        end
    end
end
