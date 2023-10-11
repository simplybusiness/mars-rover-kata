# frozen_string_literal: true

class RoverRoute
  attr_reader :route_steps

  def initialize(route_steps:)
    @route_steps = route_steps
  end
end
