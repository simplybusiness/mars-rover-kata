require_relative '../mars_rover'

RSpec.describe MarsRover do
	rover = MarsRover.new([0,0], 'N')
	x = rover.coordinates.x
	y = rover.coordinates.y
	distance = 1

	it 'initailizes starting point and direction for the rover' do
		expect(rover.cPoint).to eq([0,0])
		expect(rover.direction).to eq('N')
	end

	it 'moves the rover forwward' do
		test = rover.command_shell(distance, 'f')

		expect(rover.coordinates.x).to eq(x + distance)
		expect(rover.coordinates.y).to eq(y)
		expect(test).to eq('success')
	end

	it 'moves the rover backward' do
		test = rover.command_shell(distance, 'b')

		expect(rover.coordinates.x).to eq(x - distance)
		expect(rover.coordinates.y).to eq(y)
		expect(test).to eq('success')
	end

	it 'moves the rover left' do
		test = rover.command_shell(distance, 'l')

		expect(rover.coordinates.x).to eq(x)
		expect(rover.coordinates.y).to eq(y + distance)
		expect(test).to eq('success')
	end

	it 'moves the rover right' do
		test = rover.command_shell(distance, 'r')

		expect(rover.coordinates.x).to eq(x)
		expect(rover.coordinates.y).to eq(y - distance)
		expect(test).to eq('success')
	end

	it 'wraps around edges when applicable' do
		distance = 13

		test = rover.command_shell(distance, 'f')

		expect(rover.coordinates.x).to eq(x)
		expect(rover.coordinates.y).to eq(y)
		expect(test).to eq('success')
	end
end
