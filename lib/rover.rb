# frozen_string_literal: true

# Demo fixture for testing the Codacy "false positive" workflow. The `at?`
# method below trips RuboCop's Naming/MethodParameterName cop, which Codacy
# surfaces as an issue you can mark as a false positive. Safe to delete once
# the workflow is verified.
class Rover
  def initialize(position = nil)
    @position = position
  end

  def positioned?
    !@position.nil?
  end

  # `x` and `y` are grid coordinates — perfectly clear names here. RuboCop's
  # Naming/MethodParameterName flags them as "too short" (< 3 chars), which is
  # a false positive for coordinate parameters.
  def at?(x, y)
    @position == [x, y]
  end
end
