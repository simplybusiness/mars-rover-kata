# Rover Spec Refactoring Design

## Goal

Reduce duplication in `spec/rover_spec.rb` by extracting helper methods. Keep flat test structure, improve readability by making test setup express intent.

## Helpers

### `rover_facing(direction, x: 0, y: 0, grid: nil)`

Replaces all `Rover.new(x:, y:, direction:, grid:)` calls. Direction is the positional argument since it's what varies most. Other params have sensible defaults matching most tests.

### `grid_with_obstacles(obstacles = [], width: 5, height: 5)`

Replaces all `Grid.new(width:, height:, obstacles:)` calls. Obstacles is the positional argument. Default size is 5x5 (most common in tests). Tests needing 10x10 pass explicit width/height.

## What stays the same

- Flat test structure (no `context` blocks added)
- Test names unchanged
- Assertions unchanged
- Test count unchanged (41 tests)

## Approach

Each replacement is a separate TCR cycle via `./tcr.sh`. Tests must stay green throughout.
