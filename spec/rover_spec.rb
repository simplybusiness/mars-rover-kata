require_relative '../lib/rover'

RSpec.describe 'Rover' do
  context 'Rover is initialized' do
    it 'should initialize with a position and direction' do
      rover = Rover.new([1, 2], 'N')
      expect(rover.position).to eq([1, 2])
      expect(rover.direction).to eq('N')
    end

    it "should return direction facing when facing? is called" do
      rover = Rover.new([0, 0], 'N')
      expect(rover.facing?('N')).to be true
    end

    context 'Command' do
      it 'should accept a character array of commands' do
        rover = Rover.new([1, 2], 'N')
        expect { rover.command(['1']) }.not_to raise_error
      end

      it 'should accept an empty array' do
        rover = Rover.new([1, 2], 'N')
        expect { rover.command([]) }.not_to raise_error
      end

      it 'should throw an error if command is not an array' do
        rover = Rover.new([1, 2], 'N')
        expect { rover.command('L') }.to raise_error('Invalid command, must be an array of characters')
      end

      it 'should throw an error if command is nil' do
        rover = Rover.new([1, 2], 'N')
        expect { rover.command(nil) }.to raise_error('Invalid command, must be an array of characters')
      end

      context 'Movement' do
        DIRECTION_METHOD = {
          'N' => :north,
          'S' => :south,
          'E' => :east,
          'W' => :west
        }

        DIRECTION_METHOD.each do |dir, method|
          it "should move forward when receiving ['f'] command and facing #{dir}" do
            rover = Rover.new([0, 0], dir)
            rover.command(['f'])
            expect(rover).to have_moved_forward.send(method).from(0, 0).facing(dir)
          end
        end

        it "should move backward when receiving ['b'] command and facing N" do
          rover = Rover.new([0, 0], 'N')
          rover.command(['b'])
          expect(rover.position).to eq([0, -1])
          expect(rover.direction).to eq('N')
        end

        it "should move backward when receiving ['b'] command and facing S" do
          rover = Rover.new([0, 0], 'S')
          rover.command(['b'])
          expect(rover.position).to eq([0, 1])
          expect(rover.direction).to eq('S')
        end

        it "should move backward when receiving ['b'] command and facing E" do
          rover = Rover.new([0, 0], 'E')
          rover.command(['b'])
          expect(rover.position).to eq([-1, 0])
          expect(rover.direction).to eq('E')
        end

        it "should move backward when receiving ['b'] command and facing W" do
          rover = Rover.new([0, 0], 'W')
          rover.command(['b'])
          expect(rover.position).to eq([1, 0])
          expect(rover.direction).to eq('W')
        end
      end

      context 'Rotate' do
        context 'when rotating left' do
          it "should face W when originally facing N" do
            rover = Rover.new([0, 0], 'N')
            rover.command(['l'])
            expect(rover).to be_facing('W')
          end

          it "should face S when originally facing W" do
            rover = Rover.new([0, 0], 'W')
            rover.command(['l'])
            expect(rover).to be_facing('S')
          end
          
          it "should face E when originally facing S" do
            rover = Rover.new([0, 0], 'S')
            rover.command(['l'])
            expect(rover).to be_facing('E')
          end

          it "should face N when originally facing E" do
            rover = Rover.new([0, 0], 'E')
            rover.command(['l'])
            expect(rover).to be_facing('N')
          end
        end
      end
    end
  
    context "Position" do 
      it 'should throw an error if initialised with an invalid position [X]' do 
        expect { Rover.new([1], 'N') }.to raise_error('Invalid position, must be an array of [X, Y]')    
      end
    
      it 'should throw an error if initialised with an invalid position containing non-integer values' do 
        expect { Rover.new(['X', 2], 'N') }.to raise_error('Invalid position, must be an array of [X, Y]')    
      end
  
      it 'should throw an error if initialised with an empty position array' do 
        expect { Rover.new([], 'N') }.to raise_error('Invalid position, must be an array of [X, Y]')    
      end
    
      it 'should throw an error if initialised with no position' do 
        expect { Rover.new(nil, 'N') }.to raise_error('Invalid position, must be an array of [X, Y]')    
      end
    end
  
    context "Direction" do
      %w(N S E W).each do |dir|
        it "should accept all valid directions eg #{dir}" do
          rover = Rover.new([0, 0], dir)
          expect(rover.direction).to eq(dir)
        end
      end
    
      it 'should throw an error if initialised with an invalid direction' do
        expect { Rover.new([1, 2], 'Z') }.to raise_error('Invalid direction, must be one of N,S,W,E')
      end
    
      it 'should throw an error if initialised with no direction' do
        expect { Rover.new([1, 2], nil) }.to raise_error('Invalid direction, must be one of N,S,W,E')
      end
    end
  end
end

RSpec::Matchers.define :have_moved_forward do
  match do |rover|
    @x_movement ||= 0
    @y_movement ||= 0
    @direction ||= rover.direction
    
    expected_x = @initial_x + @x_movement
    expected_y = @initial_y + @y_movement
    
    (rover.position == [expected_x, expected_y]) && 
    (rover.direction == @direction)
  end
  
  chain :north do |steps = 1|
    @y_movement = steps
  end

  chain :south do |steps = -1|
    @y_movement = steps
  end

  chain :east do |steps = 1|
    @x_movement = steps
  end

  chain :west do |steps = -1|
    @x_movement = steps
  end
  
  chain :from do |x, y|
    @initial_x = x
    @initial_y = y
  end
  
  chain :facing do |dir|
    @direction = dir
  end
end
