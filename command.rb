require 'ostruct'

class Command

    def self.step_forward
        case state.direction
        when "N"
            @state = OpenStruct.new(x: @state.x, y: @state.y + 1, direction: @state.direction)
        when "S"
            @state = OpenStruct.new(x: @state.x, y: @state.y - 1, direction: @state.direction)
        when "E"
            @state = OpenStruct.new(x: @state.x + 1, y: @state.y, direction: @state.direction)
        when "W"
            @state = OpenStruct.new(x: @state.x - 1, y: @state.y, direction: @state.direction)
        end
    end
end
