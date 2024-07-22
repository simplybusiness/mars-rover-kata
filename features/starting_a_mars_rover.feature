Feature: Starting Direction of Mars Rover
  Scenario: Mars Rover starts at a given point (3, 2) in direction N
    Given The Mars Rover is at (3, 2) starting position
    When we ask its current position
    Then we get a signal back that its starting position is (3, 2)
    And we also get a signal back about its current direction

  Scenario: Mars Rover starts at a given point (-1, 4) in direction N
    Given The Mars Rover is at (-1, 4) starting position
    When we ask its current position
    Then we get a signal back that its starting position is (-1, 4)
    And we also get a signal back about its current direction