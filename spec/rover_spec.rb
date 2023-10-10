require_relative '../lib/rover.rb'
require_relative '../lib/coordinate.rb'

describe Rover do
  describe '#init' do
    it 'has an initial x and y coordinate of 0 when not given an explicit start point' do
      rover = Rover.new
      expect(rover.coordinate_position.x).to eq(0)
      expect(rover.coordinate_position.y).to eq(0)
    end

    it 'has position matching the coordinates it was initialized with' do
      start_position = Coordinate.new(x=3, y=5)
      rover = Rover.new(coordinates:start_position)
      expect(rover.coordinate_position.x).to eq(3)
      expect(rover.coordinate_position.y).to eq(5)
    end

    it 'has initially faces North when not given any direction' do
      rover = Rover.new
      expect(rover.direction).to eq('N')
    end

    it 'has direction matching the one it was initialized with' do
      rover = Rover.new(direction:'S')
      expect(rover.direction).to eq('S')
    end
  end

  describe '#move' do
    it 'does not move if it receives an empty route' do
      start_position = Coordinate.new(x=3, y=4)
      rover = Rover.new(coordinates:start_position)
      rover.move([])
      expect(rover.coordinate_position.x).to eq(3)
      expect(rover.coordinate_position.y).to eq(4)
    end

    it 'does raise an argument error exception if it receive an invalid route' do
      rover = Rover.new(coordinates:Coordinate.new(x=3, y=4))
      expect {rover.move(['x','y'])}.to raise_error "ArgumentError"
    end

    directions_mapping_right = { 'N' => 'E',
                           'S' => 'W',
                           'W' => 'N',
                           'E' => 'S'
    }

    directions_mapping_right.each do |start_direction,expected_direction|
      it "does face #{expected_direction} when receives a single right command in the route and starting direction of #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x=3, y=4))
        rover.move(['r'])
        expect(rover.direction).to eq(expected_direction)
      end
    end

    directions_mapping_left = { 'N' => 'W',
      'S' => 'E',
      'W' => 'S',
      'E' => 'N'
      }

    directions_mapping_left.each do |start_direction,expected_direction|
      it "does face #{expected_direction} when receives a single left command in the route and starting direction of #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x=3, y=4))
        rover.move(['l'])
        expect(rover.direction).to eq(expected_direction)
      end
    end

    directions_mapping_3x_right = { 'N' => 'W',
      'S' => 'E',
      'W' => 'S',
      'E' => 'N'
    }

    directions_mapping_3x_right.each do |start_direction,expected_direction|
      it "does face #{expected_direction} when receives a three right commands in the route and starting direction of #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x=3, y=4))
        rover.move(['r','r','r'])
        expect(rover.direction).to eq(expected_direction)
      end
    end
    
    it "does face North when receives a two right and two left commands in the route and starting direction of North" do
      rover = Rover.new(direction: 'N', coordinates:Coordinate.new(x=3, y=4))
      rover.move(['r','r','l','l'])
      expect(rover.direction).to eq('N')
    end

    directions_mapping_forward = { 'N' => Coordinate.new(x=3, y=5),
      'S' => Coordinate.new(x=3, y=3),
      'W' => Coordinate.new(x=2, y=4),
      'E' => Coordinate.new(x=4, y=4)
    }    

    directions_mapping_forward.each do |start_direction,expected_position|
      it "does move forward when receives a single forward command with direction #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x=3, y=4))
        rover.move(['f'])
        expect(rover.coordinate_position.x).to eq(expected_position.x)
        expect(rover.coordinate_position.y).to eq(expected_position.y)
      end
    end
    
    directions_mapping_backward = { 'N' => Coordinate.new(x=3, y=3),
      'S' => Coordinate.new(x=3, y=5),
      'W' => Coordinate.new(x=4, y=4),
      'E' => Coordinate.new(x=2, y=4)
    }    
    directions_mapping_backward.each do |start_direction,expected_position|
      it "does move backward when receives a single backward command with direction #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x=3, y=4))
        rover.move(['b'])
        expect(rover.coordinate_position.x).to eq(expected_position.x)
        expect(rover.coordinate_position.y).to eq(expected_position.y)
      end
    end

    xit "returns to the start position when instructed to travel the entire equator" do
      rover = Rover.new(direction: 'E',coordinates: Coordinate.new(x=0, y=0))
      rover.move(['f','f','f','f','f','f','f','f','f','f','f'])
      expect(rover.position).to eq([0,0])
    end
  end
end