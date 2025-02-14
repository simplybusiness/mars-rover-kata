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

  # Scenarios for edge cases not defined yet

  Scenario: Mars Rover has no position
    Given The Mars Rover has no starting position 
    Then we get a signal back that the Mars Rover has errored

  Scenario: Mars Rover malfunction 
     Given The Mars Rover has malfunctioned 
     Then we get a signal back about the malfunction error  

# Scenarios for Mars Rover moving forwards

  Scenario: Mars Rover facing all the 4 directions and  moving forwards in the same direction
    Given The Mars Rover is at (0, 0) starting position and facing N
    Then it moves forward to new position (0,1,N) 
    Given The Mars Rover is at (0, 0) starting position and facing E
    Then it moves forward to new position (1,0,E)
    Given The Mars Rover is at (0, 0) starting position and facing S
    Then it moves forward to new position (0,-1,S)
    Given The Mars Rover is at (0, 0) starting position and facing W
    Then it moves forward to new position (-1,0,W)  

# Scenarios for Mars Rover moving backwards

  Scenario: Mars Rover facing all the 4 directions and moving backwards in the same direction
    Given The Mars Rover is at (0, 0) starting position and facing N
    Then it moves backward to new position (0,-1,N)
    Given The Mars Rover is at (0, 0) starting position and facing E
    Then it moves backward to new position (-1,0,E)
    Given The Mars Rover is at (0, 0) starting position and facing S
    Then it moves backward to new position (0,1,S)
    Given The Mars Rover is at (0, 0) starting position and facing W
    Then it moves backward to new position (1,0,W)  

 
    

