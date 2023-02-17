require_relative '../mars_rover'

RSpec.describe MarsRover do
	rover = MarsRover.new([0,0], 'N')


	it 'initailizes starting point and direction for the rover' do
		expect(rover.cPoint).to eq([0,0])
		expect(rover.direction).to eq('N')
	end

	it 'moves the rover forwward' do
		x = rover.cPoint.first
		y = rover.cPoint.last
		distance = 1

		test = rover.command_shell(distance, 'f')

		expect(rover.coordinates.x).to eq(x + distance)
		expect(rover.coordinates.y).to eq(y)
		expect(test).to eq('success')
	end

	it 'moves the rover backward' do
		x = rover.cPoint.first
		y = rover.cPoint.last
		distance = 1

		test = rover.command_shell(distance, 'b')

		expect(rover.cPoint).to eq([x - distance,y])
		expect(test).to eq('success')
	end

	it 'moves the rover left' do
		x = rover.cPoint.first
		y = rover.cPoint.last
		distance = 1

		test = rover.command_shell(distance, 'l')

		expect(rover.cPoint).to eq([x,y + distance])
		expect(test).to eq('success')
	end

	it 'moves the rover right' do
		x = rover.cPoint.first
		y = rover.cPoint.last
		distance = 1

		test = rover.command_shell(distance, 'r')

		expect(rover.cPoint).to eq([x,y - distance])
		expect(test).to eq('success')
	end

	it 'wraps around edges when applicable' do
		x = rover.cPoint.first
		y = rover.cPoint.last
		distance = 13

		test = rover.command_shell(distance, 'f')

		expect(rover.cPoint).to eq([x,y])
		expect(test).to eq('success')
	end
end
