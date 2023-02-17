require './coordinates'

class MarsRover
	attr_reader :cPoint, :direction, :coordinates


	def initialize(cPoint, direction)
		@coordinates = Coordinates.new(cPoint.first, cPoint.last)
		@cPoint = cPoint
		@direction = direction
	end 

	def command_shell(distance, command) 
		x = @cPoint.first
		y = @cPoint.last

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

		#@cPoint = [@coordinates.x, @coordinates.y]
		return 'success'
	end

	def wrapping_detection(distance)
		return distance if distance < 13

		return 0
	end
end
