require_relative '../lib/coordinates'
require_relative '../lib/map'
require_relative '../lib/mars_rover'

RSpec::Matchers.define(:be_located_at) do |expected_position|
  match { |mars_rover| mars_rover.current_position == expected_position }
end

RSpec::Matchers.define(:be_facing) do |expected_direction|
  match { |mars_rover| mars_rover.direction == expected_direction }
end