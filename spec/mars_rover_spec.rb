require_relative '../mars_rover'

RSpec.describe MarsRover do
	rover = MarsRover.new('N')
	x = rover.coordinates.x
	y = rover.coordinates.y
	distance = 1

	it 'initailizes starting point and direction for the rover' do
		expect(rover.coordinates.x).to eq(0)
		expect(rover.coordinates.y).to eq(0)
		expect(rover.direction).to eq('N')
	end

	it 'moves the rover forwward' do
		rover.coordinates.reset()
		test = rover.command_shell(distance, 'f')

		expect(rover.coordinates.x).to eq(x + distance)
		expect(rover.coordinates.y).to eq(y)
		expect(test).to eq('success')
	end

	it 'moves the rover backward' do
		rover.coordinates.reset()
		test = rover.command_shell(distance, 'b')

		expect(rover.coordinates.x).to eq(x - distance)
		expect(rover.coordinates.y).to eq(y)
		expect(test).to eq('success')
	end

	it 'moves the rover left' do
		rover.coordinates.reset()
		test = rover.command_shell(distance, 'l')

		expect(rover.coordinates.x).to eq(x)
		expect(rover.coordinates.y).to eq(y + distance)
		expect(test).to eq('success')
	end

	it 'moves the rover right' do
		rover.coordinates.reset()
		test = rover.command_shell(distance, 'r')

		expect(rover.coordinates.x).to eq(x)
		expect(rover.coordinates.y).to eq(y - distance)
		expect(test).to eq('success')
	end

	it 'wraps around edges when applicable' do
		rover.coordinates.reset()
		distance = 13

		test = rover.command_shell(distance, 'f')

		expect(rover.coordinates.x).to eq(x)
		expect(rover.coordinates.y).to eq(y)
		expect(test).to eq('success')
	end
end
