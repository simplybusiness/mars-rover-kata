class MarsRover
    def position
        [0,0]
    end
end

RSpec.describe "mars_rover" do
    it "starts at the origin" do
        mars_rover = MarsRover.new
        expect(mars_rover.position).to eq([0, 0])
    end
    it "starts facing north"
    it "starts facing south"
    it "starts facing east"
    it "starts facing west"
    it "starts away from origin"
    it "fails if the direction is not one of the four cardinal directions"
    it "fails if the direction is not a string"
    it "fails if the origin is not a pair of integers"
end
