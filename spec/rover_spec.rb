require_relative '../lib/rover.rb'
require_relative '../lib/coordinate.rb'

describe Rover do
  context "when initialised without a position or direction" do
    it "has x and y coordinates of 0 (i.e. origin)" do
      rover = Rover.new
      expect(rover.coordinate_position.x).to eq(0)
      expect(rover.coordinate_position.y).to eq(0)
    end

    it 'faces North' do
      rover = Rover.new
      expect(rover.direction).to eq('N')
    end
  end

  context "when initialised with valid position and direction" do
    it 'has x and y coordinates equal to the position it was initialised with' do
      start_position = Coordinate.new(x_pos: 3, y_pos: 5)
      rover = Rover.new(coordinates:start_position)
      expect(rover.coordinate_position.x).to eq(3)
      expect(rover.coordinate_position.y).to eq(5)
    end

    it 'faces the direction it was initialized with' do
      rover = Rover.new(direction:'S')
      expect(rover.direction).to eq('S')
    end
  end

  context 'when instructed to move' do
    context "with an empty route" do
      it 'does not move' do
        start_position = Coordinate.new(x_pos:3 , y_pos: 4)
        rover = Rover.new(coordinates:start_position)
        rover.move([])
        expect(rover.coordinate_position.x).to eq(3)
        expect(rover.coordinate_position.y).to eq(4)
      end
    end

    context "with an invalid route (i.e. any character outside of 'f' 'b' 'l' or 'r')" do
      it 'raises an argument exception' do
        rover = Rover.new(coordinates:Coordinate.new(x_pos: 3, y_pos: 4))
        expect {rover.move(['x','y'])}.to raise_error "ArgumentError"
      end
    end

    context "with a single FORWARD command" do
      directions_mapping_forward = { 'N' => Coordinate.new(x_pos: 3, y_pos: 5),
        'S' => Coordinate.new(x_pos: 3, y_pos: 3),
        'W' => Coordinate.new(x_pos: 2, y_pos: 4),
        'E' => Coordinate.new(x_pos: 4, y_pos: 4)
      }

      directions_mapping_forward.each do |start_direction,expected_position|
        it "moves forward when starting with a direction of #{start_direction}" do
          rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x_pos: 3, y_pos: 4))
          rover.move(['f'])
          expect(rover.coordinate_position.x).to eq(expected_position.x)
          expect(rover.coordinate_position.y).to eq(expected_position.y)
        end
      end
    end

    context "with a single BACKWARD command" do
      directions_mapping_backward = { 'N' => Coordinate.new(x_pos: 3, y_pos: 3),
        'S' => Coordinate.new(x_pos: 3, y_pos: 5),
        'W' => Coordinate.new(x_pos: 4, y_pos: 4),
        'E' => Coordinate.new(x_pos: 2, y_pos: 4)
      }

      directions_mapping_backward.each do |start_direction,expected_position|
        it "moves backward when starting with a direction of #{start_direction}" do
          rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x_pos: 3, y_pos: 4))
          rover.move(['b'])
          expect(rover.coordinate_position.x).to eq(expected_position.x)
          expect(rover.coordinate_position.y).to eq(expected_position.y)
        end
      end
    end
  end

  context "when changing direction" do
    context "with a single turn RIGHT command" do
      directions_mapping_right = { 'N' => 'E',
        'S' => 'W',
        'W' => 'N',
        'E' => 'S'}

      directions_mapping_right.each do |start_direction,expected_direction|
        it "faces #{expected_direction} when starting with a direction of #{start_direction}" do
          rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x_pos: 3, y_pos: 4))
          rover.move(['r'])
          expect(rover.direction).to eq(expected_direction)
        end
      end
    end

    context "with a single turn LEFT command" do
      directions_mapping_left = { 'N' => 'W',
        'S' => 'E',
        'W' => 'S',
        'E' => 'N'}

      directions_mapping_left.each do |start_direction,expected_direction|
        it "faces #{expected_direction} when starting with a direction of #{start_direction}" do
          rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x_pos: 3, y_pos: 4))
          rover.move(['l'])
          expect(rover.direction).to eq(expected_direction)
        end
      end
    end

    context "with three turn RIGHT commands" do
      directions_mapping_3x_right = { 'N' => 'W',
        'S' => 'E',
        'W' => 'S',
        'E' => 'N'
      }

      directions_mapping_3x_right.each do |start_direction,expected_direction|
        it "faces #{expected_direction} when starting with a direction of #{start_direction}" do
          rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x_pos: 3, y_pos: 4))
          rover.move(['r','r','r'])
          expect(rover.direction).to eq(expected_direction)
        end
      end
    end

    context "with three turn LEFT commands" do
      directions_mapping_3x_left = { 'N' => 'E',
        'S' => 'W',
        'W' => 'N',
        'E' => 'S'
      }

      directions_mapping_3x_left.each do |start_direction,expected_direction|
        it "faces #{expected_direction} when starting with a direction of #{start_direction}" do
          rover = Rover.new(direction: start_direction, coordinates:Coordinate.new(x_pos: 3, y_pos: 4))
          rover.move(['l','l','l'])
          expect(rover.direction).to eq(expected_direction)
        end
      end
    end

    context "with a mixture of change direction commands" do
      it "faces it's original direction with two right and two left commands" do
        rover = Rover.new(direction: 'N', coordinates:Coordinate.new(x_pos: 3, y_pos: 4))
        rover.move(['r','r','l','l'])
        expect(rover.direction).to eq('N')
      end
    end

  end


    # xit "returns to the start position when instructed to travel the entire equator" do
    #   rover = Rover.new(direction: 'E',coordinates: Coordinate.new(x_pos: 0, y_pos: 0))
    #   rover.move(['f','f','f','f','f','f','f','f','f','f','f'])
    #   expect(rover.position).to eq([0,0])
    # end
end
