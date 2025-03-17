require_relative '../lib/rover'

RSpec.describe 'Rover' do
  context 'Rover is initialized' do
    it 'should initialize with a position and direction' do
      rover = Rover.new([1, 2], 'N')
      expect(rover.position).to eq([1, 2])
      expect(rover.direction).to eq('N')
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
        it "should move forward when receiving ['f'] command and facing N" do
          rover = Rover.new([0, 0], 'N')
          rover.command(['f'])
          expect(rover.position).to eq([0, 1])
          expect(rover.direction).to eq('N')
        end

        it "should move forward when receiving ['f'] command and facing S" do
          rover = Rover.new([0, 0], 'S')
          rover.command(['f'])
          expect(rover.position).to eq([0, -1])
          expect(rover.direction).to eq('S')
        end

        it "should move forward when receiving ['f'] command and facing E" do
          rover = Rover.new([0, 0], 'E')
          rover.command(['f'])
          expect(rover.position).to eq([1, 0])
          expect(rover.direction).to eq('E')
        end

        it "should move forward when receiving ['f'] command and facing E" do
          rover = Rover.new([0, 0], 'W')
          rover.command(['f'])
          expect(rover.position).to eq([-1, 0])
          expect(rover.direction).to eq('W')
        end

        it "should move backward when receiving ['b']"
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
