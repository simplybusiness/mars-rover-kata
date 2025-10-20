Feature: Operating a Mars Rover
  Scenario Outline: Moving a Mars Rover forward
    Given a Mars Rover is facing <original_direction>
    Then its direction is <ending_direction> when it moves forward
    Examples:
      | original_direction | ending_direction |
      | N                  | N                |
      | S                  | S                |