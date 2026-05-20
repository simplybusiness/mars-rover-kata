# CLAUDE.md Rules + TCR Tooling Design

## Goal

Create a `CLAUDE.md` file and update `tcr.sh` to enforce a strict TDD + TCR workflow when Claude works in the mars-rover-kata repo.

## CLAUDE.md Rules

### TDD — Red, Green, Refactor

1. Never write production code without a failing test first
2. Write the simplest test that fails for the next behaviour
3. Write the minimum production code to make it pass — no anticipatory design
4. Refactor only when all tests are green
5. Each cycle is one thing: one new test, OR one refactoring — never both

### TCR — Test, Commit or Revert

1. After every Red-Green or Refactor step, run `./tcr.sh "commit message"`
2. If tests pass, changes are committed with the provided message
3. If tests fail, ALL changes (lib/ and spec/) are reverted — start the step over
4. Never commit outside of `tcr.sh`
5. Commit messages should be meaningful and describe the change (e.g., `feat: Rover detects obstacles`)

### Quality

1. Small steps only — if a change feels too big to describe in one sentence, break it down
2. Follow existing code patterns and conventions in the repo
3. No speculative abstractions — only extract when duplication is real and present

## tcr.sh Changes

Update the existing `tcr.sh` script:

- Accept a commit message argument (default to "green" if none provided)
- Revert both `lib/` and `spec/` on failure (currently only reverts `lib/`)
- Add `git add -A` before commit so new files are included

### Updated script

```bash
#!/bin/sh

message=${1:-"green"}

bundle exec rspec -cfd && git add -A && git commit -m "$message" || git checkout lib spec
```

## Scope

Two files:

1. `CLAUDE.md` — new file with rules
2. `tcr.sh` — update existing script
