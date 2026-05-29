# frozen_string_literal: true

# Demo fixture: passes RuboCop (repo .rubocop.yml) but Reek reports a
# `NilCheck` smell on the `.nil?` call below. Used to test marking a
# Codacy false positive. Safe to delete once the workflow is verified.
class Rover
  def initialize(position = nil)
    @position = position
  end

  def positioned?
    !@position.nil?
  end
end
