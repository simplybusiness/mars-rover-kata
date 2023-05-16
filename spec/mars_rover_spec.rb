describe "1+1" do
  it "equals 2" do
    expect(1+1).to eq(2)
  end
end

describe "on bootup" do
  it "starts at the origin and faces N" do
    expect(rover.starting_point).to eq([coords.x, coords.y])
    expect(rover.direction).to eq("N")
  end

  it "does not start at the origin and faces N"

  it "is facing W"
end