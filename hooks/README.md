# Git hooks

Shared git hooks for this repo. They are tracked in version control and
activated per-clone with `core.hooksPath`.

## One-time setup (each clone)

```sh
git config core.hooksPath hooks
```

## What runs

- **pre-commit** — `git secrets` secret scan, then `rubocop`, then `rspec`.
- **commit-msg** / **prepare-commit-msg** — `git secrets` checks.

The `git secrets` steps are skipped automatically if `git-secrets` is not
installed, so the lint/test hook still works without it.
