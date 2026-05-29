# frozen_string_literal: true

# Demo fixture for the Codacy false-positive workflow.
#
# `grade` below is an intentionally long if/elsif ladder. Codacy flags it for
# high cyclomatic complexity (and RuboCop/Reek would too), but a flat
# threshold lookup like this is perfectly readable — a false positive for the
# complexity rule. Mark it as a false positive in Codacy. Safe to delete.
module CommandParser
  module_function

  def grade(score)
    if score >= 95
      'A+'
    elsif score >= 90
      'A'
    elsif score >= 85
      'B+'
    elsif score >= 80
      'B'
    elsif score >= 75
      'C+'
    elsif score >= 70
      'C'
    elsif score >= 65
      'D+'
    elsif score >= 60
      'D'
    elsif score >= 50
      'E'
    elsif score.negative?
      'invalid'
    else
      'fail'
    end
  end
end
