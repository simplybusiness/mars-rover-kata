# mars-rover-kata
Practise Object Oriented Design its deep synergy with TDD. More details may be found here: https://kata-log.rocks/mars-rover-kata

## Required Ruby version
3.2.1

## Testing Framework
Included are minitest and rspec. Pick one that you feel comfortable with or would like to explore.

## Incremental Kata - no peeping ahead!
This is an incremental kata to simulate a real business situation: work your way 
through the steps in order, but do not read the next requirement before you have finished your current one.

## Your Task
You’re part of the team that explores Mars by sending remotely controlled vehicles to the surface of the planet. 
Develop an API that translates the commands sent from earth to instructions that are understood by the rover.

## Requirements

- You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
- The rover receives a character array of commands.
- Implement commands that move the rover forward/backward (f,b). ['f1','r2',]
- Implement commands that turn the rover left/right (l,r).
- Implement wrapping at edges. But be careful, planets are spheres.
- Implement obstacle detection before each move to a new square. If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point, aborts the sequence and reports the obstacle.

## Rules
- TDD. No Excuses!
- Change roles (driver, navigator) after each TDD cycle.
- No red phases while refactoring.
- Be careful about edge cases and exceptions. We can not afford to lose a mars rover, just because the developers overlooked a null pointer.
