require_relative '../lib/rover.rb'

describe Rover do
  describe '#init' do
    it 'has an initial position of 0,0 when not given an explicit start point' do
      rover = Rover.new
      expect(rover.position).to eq([0,0])
    end

    it 'has position matching the coordinates it was initialized with' do
      rover = Rover.new(coordinates:[3,5])
      expect(rover.position[0]).to eq(3)
      expect(rover.position[1]).to eq(5)
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
      rover = Rover.new(coordinates:[3,4])
      rover.move([])
      expect(rover.position[0]).to eq(3)
      expect(rover.position[1]).to eq(4)
    end

    it 'does raise an argument error exception if it receive an invalid route' do
      rover = Rover.new(coordinates:[3,4])
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
        rover = Rover.new(direction: start_direction, coordinates:[3,4])
        rover.move(['r'])
        expect(rover.direction).to eq(expected_direction)
      end
    end

    directions_mapping_left.each do |start_direction,expected_direction|
      # puts directions
      it "does face #{expected_direction} when receives a single left command in the route and starting direction of #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates:[3,4])
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
      # puts directions
      it "does face #{expected_direction} when receives a three right commands in the route and starting direction of #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates:[3,4])
        rover.move(['r','r','r'])
        expect(rover.direction).to eq(expected_direction)
      end
    end
    
    it "does face North when receives a two right and two left commands in the route and starting direction of North" do
      rover = Rover.new(direction: 'N', coordinates:[3,4])
      rover.move(['r','r','l','l'])
      expect(rover.direction).to eq('N')
    end

    directions_mapping_forward = { 'N' => [3,5],
    'S' => [3,3],
    'W' => [2,4],
    'E' => [4,4]
    }    

    directions_mapping_forward.each do |start_direction,expected_position|
      it "does move forward when receives a single forward command with direction #{start_direction}" do
        rover = Rover.new(direction: start_direction, coordinates:[3,4])
        rover.move(['f'])
        expect(rover.position).to eq(expected_position)
      end
    end
    
    xit 'does move back when receives a single back command in the route'
  end
end