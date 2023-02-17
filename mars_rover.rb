require './coordinates'

class MarsRover
	attr_reader :direction, :coordinates


	def initialize(direction)
		@coordinates = Coordinates.new(0, 0)
		@direction = direction
	end 

	def command_shell(distance, command) 
		x = @coordinates.x
		y = @coordinates.y

		case command
		when 'f'
			@coordinates = Coordinates.new(x + wrapping_detection(distance), y)
		when 'b'
			@coordinates = Coordinates.new(x - wrapping_detection(distance), y)
		when 'l'
			@coordinates = Coordinates.new(x, y + wrapping_detection(distance))
		when 'r'
			@coordinates = Coordinates.new(x, y - wrapping_detection(distance))
		else
			return 'error: could not interpret command'
		end

		return 'success'
	end

	def wrapping_detection(distance)
		return distance if distance < 13

		return 0
	end
end
