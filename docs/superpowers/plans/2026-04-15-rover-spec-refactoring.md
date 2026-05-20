# Rover Spec Refactoring Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reduce duplication in `spec/rover_spec.rb` by extracting `rover_facing` and `grid_with_obstacles` helper methods.

**Architecture:** Add two helper methods inside the `RSpec.describe Rover` block, then replace each `Rover.new`/`Grid.new` call one group at a time. Each replacement group is a TCR cycle — tests must stay green throughout.

**Tech Stack:** Ruby, RSpec

**TCR Rule:** Every step that changes code MUST end with `./tcr.sh "message"`. If tests fail, all changes to `lib/` and `spec/` are reverted automatically.

---

### File Structure

- Modify: `spec/rover_spec.rb` — add helpers, replace construction calls

---

### Task 1: Add `rover_facing` helper and replace basic movement tests

**Files:**

- Modify: `spec/rover_spec.rb`

- [ ] **Step 1: Add the `rover_facing` helper method**

Add these lines immediately after `RSpec.describe Rover do` (line 4), before the first `it` block:

```ruby
  def rover_facing(direction, x: 0, y: 0, grid: nil)
    Rover.new(x: x, y: y, direction: direction, grid: grid)
  end
```

- [ ] **Step 2: Run TCR to verify adding the helper doesn't break anything**

Run: `./tcr.sh "refactor: add rover_facing helper to rover spec"`
Expected: All 41 tests pass, changes committed.

- [ ] **Step 3: Replace `Rover.new` in the first three tests (setup/edge-case tests)**

Replace in "has a starting position and direction":
```ruby
  it 'has a starting position and direction' do
    rover = rover_facing(:N)

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end
```

Replace in "receives an empty array of commands":
```ruby
  it 'receives an empty array of commands' do
    rover = rover_facing(:N)

    rover.execute([])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end
```

Replace in "ignores unrecognized commands":
```ruby
  it 'ignores unrecognized commands' do
    rover = rover_facing(:N)

    rover.execute(%w[x z])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq(:N)
  end
```

- [ ] **Step 4: Run TCR**

Run: `./tcr.sh "refactor: use rover_facing in setup and edge-case tests"`
Expected: All 41 tests pass, changes committed.

---

### Task 2: Replace `Rover.new` in forward/backward movement tests

**Files:**
- Modify: `spec/rover_spec.rb`

- [ ] **Step 1: Replace in north-facing movement tests**

Replace in "moves forward one step when facing north":
```ruby
  it 'moves forward one step when facing north' do
    rover = rover_facing(:N)

    rover.execute(['f'])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(1)
  end
```

Replace in "moves forward multiple steps when facing north":
```ruby
  it 'moves forward multiple steps when facing north' do
    rover = rover_facing(:N)

    rover.execute(%w[f f f])

    expect(rover.y).to eq(3)
  end
```

Replace in "moves backward one step when facing north":
```ruby
  it 'moves backward one step when facing north' do
    rover = rover_facing(:N)

    rover.execute(['b'])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(-1)
  end
```

- [ ] **Step 2: Run TCR**

Run: `./tcr.sh "refactor: use rover_facing in north movement tests"`
Expected: All 41 tests pass, changes committed.

- [ ] **Step 3: Replace in other direction movement tests**

Replace in "moves forward one step when facing east":
```ruby
  it 'moves forward one step when facing east' do
    rover = rover_facing(:E)

    rover.execute(['f'])

    expect(rover.x).to eq(1)
    expect(rover.y).to eq(0)
  end
```

Replace in "moves forward one step when facing south":
```ruby
  it 'moves forward one step when facing south' do
    rover = rover_facing(:S)

    rover.execute(['f'])

    expect(rover.y).to eq(-1)
  end
```

Replace in "moves forward one step when facing west":
```ruby
  it 'moves forward one step when facing west' do
    rover = rover_facing(:W)

    rover.execute(['f'])

    expect(rover.x).to eq(-1)
  end
```

Replace in "moves backward one step when facing east":
```ruby
  it 'moves backward one step when facing east' do
    rover = rover_facing(:E)

    rover.execute(['b'])

    expect(rover.x).to eq(-1)
  end
```

Replace in "moves backward one step when facing south":
```ruby
  it 'moves backward one step when facing south' do
    rover = rover_facing(:S)

    rover.execute(['b'])

    expect(rover.y).to eq(1)
  end
```

Replace in "moves backward one step when facing west":
```ruby
  it 'moves backward one step when facing west' do
    rover = rover_facing(:W)

    rover.execute(['b'])

    expect(rover.x).to eq(1)
  end
```

- [ ] **Step 4: Run TCR**

Run: `./tcr.sh "refactor: use rover_facing in all direction movement tests"`
Expected: All 41 tests pass, changes committed.

---

### Task 3: Replace `Rover.new` in turning tests

**Files:**
- Modify: `spec/rover_spec.rb`

- [ ] **Step 1: Replace in all turning tests**

Replace in "turns right from north to face east":
```ruby
  it 'turns right from north to face east' do
    rover = rover_facing(:N)

    rover.execute(['r'])

    expect(rover.direction).to eq(:E)
    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
  end
```

Replace in "turns right from east to face south":
```ruby
  it 'turns right from east to face south' do
    rover = rover_facing(:E)

    rover.execute(['r'])

    expect(rover.direction).to eq(:S)
  end
```

Replace in "turns right four times to face north again":
```ruby
  it 'turns right four times to face north again' do
    rover = rover_facing(:N)

    rover.execute(%w[r r r r])

    expect(rover.direction).to eq(:N)
  end
```

Replace in "turns left from north to face west":
```ruby
  it 'turns left from north to face west' do
    rover = rover_facing(:N)

    rover.execute(['l'])

    expect(rover.direction).to eq(:W)
  end
```

Replace in "turns left from south to face east":
```ruby
  it 'turns left from south to face east' do
    rover = rover_facing(:S)

    rover.execute(['l'])

    expect(rover.direction).to eq(:E)
  end
```

Replace in "executes a complex path with all four commands":
```ruby
  it 'executes a complex path with all four commands' do
    rover = rover_facing(:N)

    rover.execute(%w[f f r f f l b])

    expect(rover.x).to eq(2)
    expect(rover.y).to eq(1)
    expect(rover.direction).to eq(:N)
  end
```

- [ ] **Step 2: Run TCR**

Run: `./tcr.sh "refactor: use rover_facing in turning and complex path tests"`
Expected: All 41 tests pass, changes committed.

---

### Task 4: Add `grid_with_obstacles` helper and replace grid tests

**Files:**
- Modify: `spec/rover_spec.rb`

- [ ] **Step 1: Add the `grid_with_obstacles` helper method**

Add this method right after the `rover_facing` helper:

```ruby
  def grid_with_obstacles(obstacles = [], width: 5, height: 5)
    Grid.new(width: width, height: height, obstacles: obstacles)
  end
```

- [ ] **Step 2: Run TCR to verify adding the helper doesn't break anything**

Run: `./tcr.sh "refactor: add grid_with_obstacles helper to rover spec"`
Expected: All 41 tests pass, changes committed.

- [ ] **Step 3: Replace `Grid.new` and `Rover.new` in "accepts a grid" test**

```ruby
  it 'accepts a grid' do
    grid = grid_with_obstacles([], width: 10, height: 10)
    rover = rover_facing(:N, grid: grid)

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
  end
```

- [ ] **Step 4: Run TCR**

Run: `./tcr.sh "refactor: use helpers in accepts-a-grid test"`
Expected: All 41 tests pass, changes committed.

---

### Task 5: Replace in wrapping tests

**Files:**
- Modify: `spec/rover_spec.rb`

- [ ] **Step 1: Replace all wrapping tests**

Replace in "wraps when moving north past the top edge":
```ruby
  it 'wraps when moving north past the top edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:N, x: 0, y: 4, grid: grid)

    rover.execute(['f'])

    expect(rover.y).to eq(0)
    expect(rover.x).to eq(0)
  end
```

Replace in "wraps when moving south past the bottom edge":
```ruby
  it 'wraps when moving south past the bottom edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:S, grid: grid)

    rover.execute(['f'])

    expect(rover.y).to eq(4)
  end
```

Replace in "wraps when moving east past the right edge":
```ruby
  it 'wraps when moving east past the right edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:E, x: 4, grid: grid)

    rover.execute(['f'])

    expect(rover.x).to eq(0)
  end
```

Replace in "wraps when moving west past the left edge":
```ruby
  it 'wraps when moving west past the left edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:W, grid: grid)

    rover.execute(['f'])

    expect(rover.x).to eq(4)
  end
```

Replace in "wraps when moving backward past an edge":
```ruby
  it 'wraps when moving backward past an edge' do
    grid = grid_with_obstacles
    rover = rover_facing(:N, grid: grid)

    rover.execute(['b'])

    expect(rover.y).to eq(4)
  end
```

- [ ] **Step 2: Run TCR**

Run: `./tcr.sh "refactor: use helpers in wrapping tests"`
Expected: All 41 tests pass, changes committed.

---

### Task 6: Replace in obstacle tests

**Files:**
- Modify: `spec/rover_spec.rb`

- [ ] **Step 1: Replace "reports no obstacle detected" test**

```ruby
  it 'reports no obstacle detected after normal movement' do
    rover = rover_facing(:N)

    rover.execute(['f'])

    expect(rover.obstacle_detected?).to be false
  end
```

- [ ] **Step 2: Run TCR**

Run: `./tcr.sh "refactor: use rover_facing in no-obstacle test"`
Expected: All 41 tests pass, changes committed.

- [ ] **Step 3: Replace remaining obstacle tests**

Replace in "stops before an obstacle when moving forward":
```ruby
  it 'stops before an obstacle when moving forward' do
    grid = grid_with_obstacles([[0, 1]], width: 10, height: 10)
    rover = rover_facing(:N, grid: grid)

    rover.execute(['f'])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.obstacle_detected?).to be true
  end
```

Replace in "aborts remaining commands after hitting an obstacle":
```ruby
  it 'aborts remaining commands after hitting an obstacle' do
    grid = grid_with_obstacles([[0, 2]], width: 10, height: 10)
    rover = rover_facing(:N, grid: grid)

    rover.execute(%w[f f f])

    expect(rover.x).to eq(0)
    expect(rover.y).to eq(1)
    expect(rover.obstacle_detected?).to be true
  end
```

Replace in "stops before an obstacle when moving backward":
```ruby
  it 'stops before an obstacle when moving backward' do
    grid = grid_with_obstacles([[0, 4]], width: 10, height: 10)
    rover = rover_facing(:N, x: 0, y: 5, grid: grid)

    rover.execute(['b'])

    expect(rover.y).to eq(5)
    expect(rover.obstacle_detected?).to be true
  end
```

Replace in "detects obstacle at a wrapped position":
```ruby
  it 'detects obstacle at a wrapped position' do
    grid = grid_with_obstacles([[0, 0]])
    rover = rover_facing(:N, x: 0, y: 4, grid: grid)

    rover.execute(['f'])

    expect(rover.y).to eq(4)
    expect(rover.obstacle_detected?).to be true
  end
```

Replace in "handles a complex path with obstacles, wrapping, and turning":
```ruby
  it 'handles a complex path with obstacles, wrapping, and turning' do
    grid = grid_with_obstacles([[2, 2]])
    rover = rover_facing(:N, grid: grid)

    rover.execute(%w[f f r f f l f])

    expect(rover.x).to eq(1)
    expect(rover.y).to eq(2)
    expect(rover.direction).to eq(:E)
    expect(rover.obstacle_detected?).to be true
  end
```

- [ ] **Step 4: Run TCR**

Run: `./tcr.sh "refactor: use helpers in all obstacle tests"`
Expected: All 41 tests pass, changes committed.
