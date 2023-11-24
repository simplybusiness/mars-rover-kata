require_relative '../lib/rover.rb'
require_relative '../lib/coordinate.rb'


RSpec::Matchers.define :be_located_at do |coordinates|
  match do |rover|
    rover.coordinates == coordinates
  end
end

RSpec::Matchers.define :be_facing do |position|
  match do |rover|
    rover.direction == position
  end
end

describe Rover do
  describe '#init' do
    it 'has an initial position of 0,0 when not given an explicit start point' do
      rover = Rover.new

      expect(rover).to be_located_at(Coordinate.new(0,0))
    end

    it 'has position matching the coordinates it was initialized with' do
      rover = Rover.new(coordinates: Coordinate.new(3, 5))
      expect(rover).to be_located_at(Coordinate.new(3,5))
    end

    it 'has initially faces North when not given any direction' do
      rover = Rover.new

      expect(rover).to be_facing ("N")
    end

    it 'has direction matching the one it was initialized with' do
      rover = Rover.new(direction:'S')
      expect(rover).to be_facing('S')
    end
  end

  describe '#move' do
    it 'does not move if it receives an empty route' do
      rover = Rover.new(coordinates: Coordinate.new(3,4))
      rover.move([])
      expect(rover).to be_located_at(Coordinate.new(3,4))
    end

    it 'does raise an argument error exception if it receive an invalid route' do
      rover = Rover.new(coordinates: Coordinate.new(3,4))
      expect {rover.move(['x','y'])}.to raise_error "ArgumentError"
    end

    directions_mapping_right = { 'N' => 'E',
                           'S' => 'W',
                           'W' => 'N',
                           'E' => 'S'
    }

    directions_mapping_left = { 'N' => 'W',
                          'S' => 'E',
                          'W' => 'S',
                          'E' => 'N'
                          }


    directions_mapping_right.each do |start_direction,expected_direction|
      # puts directions
      it "does face #{expected_direction} when receives a single right command in the route and starting direction of #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates: Coordinate.new(3,4))
        rover.move(['r'])
        expect(rover).to be_facing(expected_direction)
      end
    end

    directions_mapping_left.each do |start_direction,expected_direction|
      # puts directions
      it "does face #{expected_direction} when receives a single left command in the route and starting direction of #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates: Coordinate.new(3,4))
        rover.move(['l'])
        expect(rover).to be_facing(expected_direction)
      end
    end

    directions_mapping_3x_right = { 'N' => 'W',
      'S' => 'E',
      'W' => 'S',
      'E' => 'N'
    }

    directions_mapping_3x_right.each do |start_direction,expected_direction|
      it "does face #{expected_direction} when receives a three right commands in the route and starting direction of #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates: Coordinate.new(3,4))
        rover.move(['r','r','r'])
        expect(rover).to be_facing(expected_direction)
      end
    end

    it "does face North when receives a two right and two left commands in the route and starting direction of North" do
      rover = Rover.new(direction: 'N', coordinates: Coordinate.new(3,4))
      rover.move(['r','r','l','l'])
      expect(rover).to be_facing('N')
    end

    directions_mapping_backward = { 'N' => Coordinate.new(3,3),
      'S' => Coordinate.new(3,5),
      'W' => Coordinate.new(4,4),
      'E' => Coordinate.new(2,4)
    }
    directions_mapping_backward.each do |start_direction,expected_position|
      it "does move backward when receives a single backward command with direction #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates: Coordinate.new(3,4), planet: Planet.new(10,10))
        rover.move(['b'])
        expect(rover).to be_located_at (Coordinate.new(expected_position.x,expected_position.y))
      end
    end


    move_forward_cases = [
      {"start_position" => Coordinate.new(3,4), "start_direction" => 'N', "expected_position" => Coordinate.new(3,5)},
      {"start_position" => Coordinate.new(3,4), "start_direction" => 'S', "expected_position" => Coordinate.new(3,3)},
      {"start_position" => Coordinate.new(3,4), "start_direction" => 'W', "expected_position" => Coordinate.new(2,4)},
      {"start_position" => Coordinate.new(3,4), "start_direction" => 'E', "expected_position" => Coordinate.new(4,4)},
      {"start_position" => Coordinate.new(5,0), "start_direction" => 'E', "expected_position" => Coordinate.new(-5,0)},
      {"start_position" => Coordinate.new(-5,0), "start_direction" => 'W', "expected_position" => Coordinate.new(5,0)},
      {"start_position" => Coordinate.new(0,5), "start_direction" => 'N', "expected_position" => Coordinate.new(0,-5)},
      {"start_position" => Coordinate.new(0,-5), "start_direction" => 'S', "expected_position" => Coordinate.new(0,5)}
    ]

    move_forward_cases.each do |test_params|
      it "moves to #{test_params["expected_position"].inspect} from #{test_params["start_position"].inspect} when facing #{test_params["start_direction"]} and move by 1" do
        rover = Rover.new(direction: test_params["start_direction"], coordinates: test_params["start_position"], planet: Planet.new(10,10))
        rover.move(['f'])
        expect(rover).to be_located_at(test_params["expected_position"])
      end
    end

    xit "returns to the start position when instructed to travel the entire equator" do
      rover = Rover.new(direction: 'E', coordinates: Coordinate.new(0,0))
      rover.move(['f','f','f','f','f','f','f','f','f','f','f'])
      expect(rover).to be_located_at(Coordinate.new(0,0))
    end
  end
end
