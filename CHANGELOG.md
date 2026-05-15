# Changelog

## v0.1.2

- Adds a required bloat baseline before simplification.
- Prioritizes deletion, deduplication, and consolidation before local polish.
- Requires final output to report net-size impact and remaining bloat targets.

## v0.1.1

- Adds explicit comment, docstring, and touched-doc cleanup to the Simplify quality pass.
- Preserves durable comments and docs that explain intent, invariants, constraints, compatibility, security, performance tradeoffs, or user-facing behavior.

## v0.1.0

- Initial public Codex Simplify release.
- Adds the Codex `code-simplifier` plugin with the `simplify` skill.
- Adds OpenCode `/simplify` and Pi package metadata adapters.
