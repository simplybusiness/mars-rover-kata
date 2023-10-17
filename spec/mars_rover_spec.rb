# frozen_string_literal: true

require_relative '../lib/mars_rover'
require_relative '../lib/rover_route'

RSpec.describe MarsRover do
  describe '.new' do
    context 'when the mars rover is initialised' do
      subject(:mars_rover) { described_class.new(x_pos: 1, y_pos: '2', cardinal_direction: 'E') }

      it 'returns mars rover entity' do
        expect(mars_rover).not_to be_nil
      end
      it 'contains a starting point' do
        expect(mars_rover.x_pos).to eq(1)
        expect(mars_rover.y_pos).to eq(2)
      end

      it 'contains a direction' do
        expect(mars_rover.cardinal_direction).to eq('E')
      end
    end

    context 'when the mars rover is initialised with invalid arguments' do
      it 'raises an error for wrong directions' do
        expect { described_class.new(x_pos: 0, y_pos: 0, cardinal_direction: 'X') }
          .to raise_error InvalidMarsRoverDirection
      end

      it 'raises an error for wrong geo locations' do
        expect { described_class.new(x_pos: 0, y_pos: 'Z', cardinal_direction: 'E') }
          .to raise_error InvalidMarsRoverGeoLocation
      end
    end
  end

  describe '#change_position' do
    let(:mars_rover) { described_class.new(x_pos: 0, y_pos: 0, cardinal_direction: 'N') }

    context '[when commands are valid]' do

      it 'does not raise an error' do
        valid_routes_list = RoverRoute.new(route_steps: ['f'])
        expect { mars_rover.change_position(valid_routes_list) }.not_to raise_error
      end

      directions_mapping_forward_single = { 'N' => [0,1], 'S' => [0,-1], 'E' => [1,0], 'W' => [-1,0] }

      directions_mapping_forward_single.each do | start_direction, expected_position |
        it "moves forward when receiving a single forward command and its facing #{start_direction}" do
          mars_rover = MarsRover.new(x_pos: 0, y_pos: 0, cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['f'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.x_pos).to eq(expected_position[0])
          expect(mars_rover.y_pos).to eq(expected_position[1])
          expect(mars_rover.cardinal_direction).to eq(start_direction)
        end
      end

      directions_mapping_forward_multiple = { 'N' => [0,2], 'S' => [0,-2], 'E' => [2,0], 'W' => [-2,0] }

      directions_mapping_forward_multiple.each do | start_direction, expected_position |
        it "moves forward when receiving multiple forward commands and its facing #{start_direction}" do
          mars_rover = MarsRover.new(x_pos: 0, y_pos: 0, cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['f', 'f'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.x_pos).to eq(expected_position[0])
          expect(mars_rover.y_pos).to eq(expected_position[1])
          expect(mars_rover.cardinal_direction).to eq(start_direction)
        end
      end

      directions_mapping_backward_single = { 'N' => [0,-1], 'S' => [0,1], 'E' => [-1,0], 'W' => [1,0] }

      directions_mapping_backward_single.each do | start_direction, expected_position |
        it 'moves backward when receiving a single backward command and its facing #{start_direction}' do
          mars_rover = MarsRover.new(x_pos: 0, y_pos: 0, cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['b'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.x_pos).to eq(expected_position[0])
          expect(mars_rover.y_pos).to eq(expected_position[1])
          expect(mars_rover.cardinal_direction).to eq(start_direction)
        end
      end

      directions_mapping_backward_multiple = { 'N' => [0,-2], 'S' => [0,2], 'E' => [-2,0], 'W' => [2,0] }

      directions_mapping_backward_multiple.each do | start_direction, expected_position |
        it 'moves backward when receiving multiple backward commands and its facing #{start_direction}' do
          mars_rover = MarsRover.new(x_pos: 0, y_pos: 0, cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['b', 'b'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.x_pos).to eq(expected_position[0])
          expect(mars_rover.y_pos).to eq(expected_position[1])
          expect(mars_rover.cardinal_direction).to eq(start_direction)
        end
      end

      directions_mapping_left_single = { 'N' => 'W', 'S' => 'E', 'E' => 'N', 'W' => 'S' }

      directions_mapping_left_single.each do | start_direction, expected_position |
        it 'turns left when receiving a single left command and its facing #{start_direction}' do
          mars_rover = MarsRover.new(x_pos: 0, y_pos: 0, cardinal_direction: start_direction)
          valid_route = RoverRoute.new(route_steps: ['l'])
          mars_rover.change_position(valid_route)

          expect(mars_rover.cardinal_direction).to eq(expected_position)
          expect(mars_rover.x_pos).to eq(0)
          expect(mars_rover.y_pos).to eq(0)
        end
      end

      it 'turns left when receiving multiple left commands and its facing #{start_direction}'

      it 'turns right when receiving a single right command and its facing #{start_direction}'

      it 'turns right when receiving multiple right commands and its facing #{start_direction}'

    end
  end
end
