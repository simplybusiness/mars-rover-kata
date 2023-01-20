# # frozen_string_literal: true

# # Mars ROver
# class MarsRover
#   attr_accessor :x, :y, :orientation

#   def initialize(x,y,orientation)
#     @x = x
#     @y = y
#     @orientation = "N"
#   end

#   def execute(commands)
#     process(commands).each do |command|
#       if command == "f"
#         @y = @y + 1
#       elsif command == "b"
#         @y = @y - 1
#       elsif command == "r"
#         @orientation = "E"
#       elsif command == "l"
#         @orientation = "W"
#       else
#         @y
#       end
#     end
#   end

#   def process(commands)
#     commands.chars
#   end
# end
