Feature: Operating a Mars Rover
  Scenario Outline: Moving a Mars Rover forward
    Given a Mars Rover is facing "<original_direction>"
    Then its direction is unchanged when it moves forward
    Examples:
      | original_direction |
      | N                  |
      | S                  |
      | E                  |
      | W                  |

  Scenario: Starting up a Mars Rover
    Given a Mars Rover is facing an invalid direction it raises an error