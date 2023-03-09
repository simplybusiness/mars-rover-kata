class MarsRover
    def initialize (direction = "north", position = [0,0]) 
        @position = position
        @direction = direction

        # check parameter is a string
        unless direction.is_a?(String)
            raise ArgumentError, "Direction must be a string"
        end

        # check parameter is a cardinal direction
        unless cardinal_directions.include?(@direction)
            raise ArgumentError, "Direction must be one of the four cardinal directions"
        end

        # check that the origin is a pair of integers
        unless position.is_a?(Array) && position.length == 2 && position.all? { |x| x.is_a?(Integer) } # Hemal - I am not overly clear ion what the end part ois doing. I think it's iterating through the items in the array and checking each is an integer
            raise ArgumentError, "Origin must be a pair of integers"
        end 
    end

    def cardinal_directions
        ["north", "south", "east", "west"]
    end

    def position 
        @position
    end

    def direction
        @direction
    end
        
end

RSpec.describe "mars_rover" do
    it "starts at the origin by default" do
        mars_rover = MarsRover.new
        expect(mars_rover.position).to eq([0, 0])
    end
    it "starts facing north by default" do
        mars_rover = MarsRover.new
        expect(mars_rover.direction).to eq("north")
    end
    it "starts facing south" do
        mars_rover = MarsRover.new("south")
        expect(mars_rover.direction).to eq("south")
    end
    it "starts facing east" do 
        mars_rover = MarsRover.new("east")
        expect(mars_rover.direction).to eq("east")
    end
    it "starts facing west" do
        mars_rover = MarsRover.new("west")
        expect(mars_rover.direction).to eq("west")
    end
    it "starts away from origin" do
        mars_rover = MarsRover.new("south", [1,1])
        expect(mars_rover.position).to eq([1,1])
    end
    it "fails when initislsed with a direction that is not one of the four cardinal directions" do
        expect { 
            mars_rover = MarsRover.new("South-East") 
        }.to raise_error(ArgumentError)
    end
    it "fails if the direction is not a string" do
        expect {
            mars_rover = MarsRover.new(1)
        }.to raise_error(ArgumentError)
    end
    it "fails if the origin is not a pair of integers" do
        expect {
            mars_rover = MarsRover.new("north", [1, "1"])
        }.to raise_error(ArgumentError)
    end
end
