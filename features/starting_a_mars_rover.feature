Feature: Starting Direction of Mars Rover
  Scenario: Mars Rover starts at a given point (3, 2) in direction N
    Given The Mars Rover is at (3, 2) starting position and facing N
    When we ask its current position
    When we ask its current direction
    Then we get a signal back that its starting position is (3, 2)
    And we also get a signal back about its current direction N

  Scenario: Mars Rover starts at a given point (-1, 4) in direction S
    Given The Mars Rover is at (-1, 4) starting position and facing S
    When we ask its current position
    When we ask its current direction
    Then we get a signal back that its starting position is (-1, 4)
    And we also get a signal back about its current direction S

  Scenario: Mars Rover has no position
    Given The Mars Rover has no starting position 
    Then we get a signal back that the Mars Rover has errored
   
  Scenario: Mars Rover moving forwards in the same direction
    Given The Mars Rover is at (0, 0) starting position and facing N
    Then it moves forward to new position (0,1) still facing North

   Scenario: Mars Rover facing east moving forwards in the same direction
    Given The Mars Rover is at (0, 0) starting position and facing E
    Then it moves forward to new position (1,0) still facing East