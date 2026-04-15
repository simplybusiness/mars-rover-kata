# CLAUDE.md Rules + TCR Tooling Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a CLAUDE.md rules file and update tcr.sh to enforce strict TDD + TCR workflow.

**Architecture:** Two independent files — CLAUDE.md (convention-based rules Claude reads) and tcr.sh (mechanical enforcement of test-commit-or-revert). The tcr.sh script is the single enforcement point for all commits.

**Tech Stack:** Shell script (sh), Markdown, RSpec (existing)

---

### File Structure

- Create: `CLAUDE.md` — rules file Claude reads when working in this repo
- Modify: `tcr.sh` — update existing TCR script to accept message arg, revert both lib/ and spec/

---

### Task 1: Update tcr.sh

**Files:**
- Modify: `tcr.sh`

- [ ] **Step 1: Read current tcr.sh and verify current behavior**

Run: `cat tcr.sh`
Expected content:
```bash
#!/bin/sh

bundle exec rspec -cfd && git commit -am "Test passes" || git checkout lib
```

- [ ] **Step 2: Update tcr.sh with new behavior**

Replace the entire content of `tcr.sh` with:

```bash
#!/bin/sh

message=${1:-"green"}

bundle exec rspec -cfd && git add -A && git commit -m "$message" || git checkout lib spec
```

Changes:
- Accept commit message as first argument (default: "green")
- Add `git add -A` before commit so new/untracked files are included
- Revert both `lib/` and `spec/` on failure (was only `lib/`)

- [ ] **Step 3: Verify the script is executable**

Run: `ls -la tcr.sh`
Expected: `-rwxr-xr-x` (executable bit set). If not, run `chmod +x tcr.sh`.

- [ ] **Step 4: Run tests to confirm existing tests still pass**

Run: `bundle exec rspec -cfd`
Expected: All tests pass (green).

- [ ] **Step 5: Commit**

```bash
git add tcr.sh
git commit -m "feat: tcr.sh accepts commit message, reverts lib/ and spec/ on failure"
```

---

### Task 2: Create CLAUDE.md

**Files:**
- Create: `CLAUDE.md`

- [ ] **Step 1: Create CLAUDE.md with all rules**

Create `CLAUDE.md` at the project root with:

```markdown
# Rules

## TDD — Red, Green, Refactor

1. Never write production code without a failing test first
2. Write the simplest test that fails for the next behaviour
3. Write the minimum production code to make it pass — no anticipatory design
4. Refactor only when all tests are green
5. Each cycle is one thing: one new test, OR one refactoring — never both

## TCR — Test, Commit or Revert

1. After every Red-Green or Refactor step, run `./tcr.sh "commit message"`
2. If tests pass, changes are committed with the provided message
3. If tests fail, ALL changes (lib/ and spec/) are reverted — start the step over
4. Never commit outside of `tcr.sh`
5. Commit messages should be meaningful and describe the change (e.g., `feat: Rover detects obstacles`)

## Quality

1. Small steps only — if a change feels too big to describe in one sentence, break it down
2. Follow existing code patterns and conventions in the repo
3. No speculative abstractions — only extract when duplication is real and present
```

- [ ] **Step 2: Verify the file reads correctly**

Run: `cat CLAUDE.md`
Expected: The full rules content as above.

- [ ] **Step 3: Commit**

```bash
git add CLAUDE.md
git commit -m "feat: add CLAUDE.md with TDD, TCR, and quality rules"
```
