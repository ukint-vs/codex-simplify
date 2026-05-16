# Changelog

## v0.2.0

- Replaces generic subagent prompts with concrete anti-pattern checklists per pass (reuse, quality, efficiency).
- Passes a single unified diff payload to each subagent so analysis is grounded in the actual changes.
- Slims the OpenCode command and Codex prompt files to thin shims that delegate to the canonical skill.

## v0.1.3

- Reframes the workflow around tightening large post-implementation diffs.
- Updates final reporting language to focus on net changed lines and remaining cleanup targets.

## v0.1.2

- Adds a required diff baseline before simplification.
- Prioritizes deletion, deduplication, and consolidation before local polish.
- Requires final output to report net changed lines and remaining cleanup targets.

## v0.1.1

- Adds explicit comment, docstring, and touched-doc cleanup to the Simplify quality pass.
- Preserves durable comments and docs that explain intent, invariants, constraints, compatibility, security, performance tradeoffs, or user-facing behavior.

## v0.1.0

- Initial public Codex Simplify release.
- Adds the Codex `code-simplifier` plugin with the `simplify` skill.
- Adds OpenCode `/simplify` and Pi package metadata adapters.
