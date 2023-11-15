# frozen_string_literal: true

require_relative '../lib/mars_rover'
require_relative '../lib/rover_route'

RSpec.describe MarsRover do
  describe '.new' do
    context 'when the mars rover is initialised' do
      subject(:mars_rover) { described_class.new(coordinates: Coordinates.new(x: 1, y: 2), cardinal_direction: 'E') }

      it 'returns mars rover entity' do
        expect(mars_rover).not_to be_nil
      end
      it 'contains a starting point' do
        expect(mars_rover.coordinates.x_pos).to eq(1)
        expect(mars_rover.coordinates.y_pos).to eq(2)
      end

      it 'contains a direction' do
        expect(mars_rover.cardinal_direction).to eq('E')
      end
    end

    context 'when the mars rover is initialised with invalid arguments' do
      it 'raises an error for wrong directions' do
        expect { described_class.new(coordinates: Coordinates.new(x:0, y:0), cardinal_direction: 'X') }
        .to raise_error InvalidMarsRoverDirection
      end

      it 'raises an error for wrong geo locations' do
        expect { described_class.new(coordinates: Coordinates.new(x:0, y:'Z'), cardinal_direction: 'E') }
          .to raise_error InvalidMarsRoverGeoLocation
      end
    end
  end

  describe '#change_position' do
    let(:mars_rover) { described_class.new(coordinates: Coordinates.new(x:0, y:0), cardinal_direction: 'N') }

    context '[when route commands are valid]' do

      it 'does not raise an error' do
        valid_routes_list = RoverRoute.new(route_steps: ['f'])
        expect { mars_rover.change_position(valid_routes_list) }.not_to raise_error
      end

      directions_mapping_forward_single = { 'N' => [1,2], 'S' => [1,0], 'E' => [2,1], 'W' => [0,1] }

      directions_mapping_forward_single.each do | start_direction, expected_position |
        it "moves forward when receiving a single forward command and its facing #{start_direction}" do
          mars_rover = MarsRover.new(coordinates: Coordinates.new(x:1, y:1), cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['f'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.coordinates.x_pos).to eq(expected_position[0])
          expect(mars_rover.coordinates.y_pos).to eq(expected_position[1])
          expect(mars_rover.cardinal_direction).to eq(start_direction)
        end
      end

      directions_mapping_forward_multiple = { 'N' => [1,3], 'S' => [1,-1], 'E' => [3,1], 'W' => [-1,1] }

      directions_mapping_forward_multiple.each do | start_direction, expected_position |
        it "moves forward when receiving multiple forward commands and its facing #{start_direction}" do
          mars_rover = MarsRover.new(coordinates: Coordinates.new(x:1, y:1), cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['f', 'f'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.coordinates.x_pos).to eq(expected_position[0])
          expect(mars_rover.coordinates.y_pos).to eq(expected_position[1])
          expect(mars_rover.cardinal_direction).to eq(start_direction)
        end
      end

      directions_mapping_backward_single = { 'N' => [1,0], 'S' => [1,2], 'E' => [0,1], 'W' => [2,1] }

      directions_mapping_backward_single.each do | start_direction, expected_position |
        it "moves backward when receiving a single backward command and its facing #{start_direction}" do
          mars_rover = MarsRover.new(coordinates: Coordinates.new(x:1, y:1), cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['b'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.coordinates.x_pos).to eq(expected_position[0])
          expect(mars_rover.coordinates.y_pos).to eq(expected_position[1])
          expect(mars_rover.cardinal_direction).to eq(start_direction)
        end
      end

      directions_mapping_backward_multiple = { 'N' => [1,-1], 'S' => [1,3], 'E' => [-1,1], 'W' => [3,1] }

      directions_mapping_backward_multiple.each do | start_direction, expected_position |
        it "moves backward when receiving multiple backward commands and its facing #{start_direction}" do
          mars_rover = MarsRover.new(coordinates: Coordinates.new(x:1, y:1), cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['b', 'b'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.coordinates.x_pos).to eq(expected_position[0])
          expect(mars_rover.coordinates.y_pos).to eq(expected_position[1])
          expect(mars_rover.cardinal_direction).to eq(start_direction)
        end
      end

      directions_mapping_left_single = { 'N' => 'W', 'S' => 'E', 'E' => 'N', 'W' => 'S' }

      directions_mapping_left_single.each do | start_direction, expected_position |
        it "turns left when receiving a single left command and its facing #{start_direction}" do
          mars_rover = MarsRover.new(coordinates: Coordinates.new(x:1, y:1), cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['l'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.cardinal_direction).to eq(expected_position)
          expect(mars_rover.coordinates.x_pos).to eq(1)
          expect(mars_rover.coordinates.y_pos).to eq(1)
        end
      end

      directions_mapping_left_multiple = { 'N' => 'S', 'S' => 'N', 'E' => 'W', 'W' => 'E' }

      directions_mapping_left_multiple.each do | start_direction, expected_position |
        it "faces a new when receiving two left commands and having been facing #{start_direction} originally" do
          mars_rover = MarsRover.new(coordinates: Coordinates.new(x:1, y:1), cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['l', 'l'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.cardinal_direction).to eq(expected_position)
          expect(mars_rover.coordinates.x_pos).to eq(1)
          expect(mars_rover.coordinates.y_pos).to eq(1)
        end
      end

      directions_mapping_right_single = { 'N' => 'E', 'S' => 'W', 'E' => 'S', 'W' => 'N' }

      directions_mapping_right_single.each do | start_direction, expected_position |
        it "turns left when receiving a single right command and its facing #{start_direction}" do
          mars_rover = MarsRover.new(coordinates: Coordinates.new(x:1, y:1), cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['r'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.cardinal_direction).to eq(expected_position)
          expect(mars_rover.coordinates.x_pos).to eq(1)
          expect(mars_rover.coordinates.y_pos).to eq(1)
        end
      end

      directions_mapping_right_multiple = { 'N' => 'S', 'S' => 'N', 'E' => 'W', 'W' => 'E' }

      directions_mapping_right_multiple.each do | start_direction, expected_position |
        it "faces a new when receiving two right commands and having been facing #{start_direction} originally" do
          mars_rover = MarsRover.new(coordinates: Coordinates.new(x:1, y:1), cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['r', 'r'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.cardinal_direction).to eq(expected_position)
          expect(mars_rover.coordinates.x_pos).to eq(1)
          expect(mars_rover.coordinates.y_pos).to eq(1)
        end
      end

    end

    context "[when the route contains an invalid command (e.g. something other than f, b, l or r)]" do
      it "ignores the invalid commands but execute all valid commands" do
        mars_rover = MarsRover.new(coordinates: Coordinates.new(x:1, y:1), cardinal_direction: "N")
        route = RoverRoute.new(route_steps: ['l', 'f', 'x', 'f', 'f'])
        mars_rover.change_position(route)
        expect(mars_rover.cardinal_direction).to eq('W')
        expect(mars_rover.coordinates.x_pos).to eq(-2)
        expect(mars_rover.coordinates.y_pos).to eq(1)
      end
    end
  end
end
