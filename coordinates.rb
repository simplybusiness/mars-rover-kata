class Coordinates

	attr_reader :x, :y

	def initialize(x, y)
		@x = x
		@y = y
	end

	def reset()
		@x = 0
		@y = 0
	end
end